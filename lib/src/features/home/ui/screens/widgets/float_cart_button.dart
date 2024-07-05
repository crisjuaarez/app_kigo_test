import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_dimens.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../ui/theme/app_theme.dart';
import '../../../../../ui/widgets/button/my_button.dart';
import '../../../../products/ui/providers/cart_provider.dart';
import '../../../../products/ui/widgets/cart_counter.dart';

class FloatCartButton extends StatelessWidget {
  const FloatCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => const CartModalSheet(),
            );
          },
          child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Transform.scale(
            scale: 1.5,
            child: const CartCounter(style: CartCounterStyle.secondary),
          ),
        ),
      ],
    );
  }
}

class CartModalSheet extends StatelessWidget {
  const CartModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppDimens.defaultAllPadding,
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                color: AppTheme.secondaryColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                AppStrings.cartTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (_, notifier, __) {
                  final products = notifier.cart;
                  if (products.isEmpty) {
                    return const Center(child: Text(AppStrings.cartEmpty));
                  }
                  return ListView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    itemBuilder: (_, i) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(products[i].id.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: AppDimens.defaultHorizontalPadding,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (_) {
                          notifier.removeFromCart(products[i]);
                          if (products.isEmpty) Navigator.pop(context);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 55,
                          leading: ClipOval(
                            child: Image.network(
                              products[i].image,
                              height: 55,
                              width: 55,
                            ),
                          ),
                          title: Text(products[i].title, maxLines: 1),
                          subtitle: Text(
                            '\$${products[i].price.toStringAsFixed(2)}',
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    notifier.decrementQuantity(products[i]);
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${products[i].quantity}',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    notifier.incrementQuantity(products[i]);
                                  },
                                  child: const Icon(
                                    Icons.add_circle_outlined,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<CartProvider>(
              builder: (_, provider, __) {
                if (provider.cart.isEmpty) return const SizedBox.shrink();
                return MyButton(
                  text: 'Pagar \$${provider.totalPrice.toStringAsFixed(2)}',
                  onPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
