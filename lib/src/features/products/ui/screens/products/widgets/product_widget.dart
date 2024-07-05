import 'package:app_kigo_test/src/features/home/ui/screens/widgets/float_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/app_dimens.dart';
import '../../../../../../core/constants/app_font_sizes.dart';
import '../../../../../../ui/theme/app_theme.dart';
import '../../../../domain/entities/product.dart';
import '../../../providers/cart_provider.dart';
import '../../../widgets/product_image.dart';
import '../../detail/product_detail_screen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        ),
      ),
      child: Material(
        elevation: 12,
        shadowColor: Colors.black38,
        borderRadius: BorderRadius.circular(
          AppDimens.defaultBorderRadiusValue,
        ),
        child: GridTile(
          child: Column(
            children: [
              Expanded(
                child: ProductImage(product: product, fit: BoxFit.cover),
              ),
              Container(
                padding: AppDimens.defaultAllPadding,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      AppDimens.defaultBorderRadiusValue,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: AppFontSizes.bodyMedium,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: AppFontSizes.bodyMedium,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .addToCart(product.to());
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => const CartModalSheet(),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
