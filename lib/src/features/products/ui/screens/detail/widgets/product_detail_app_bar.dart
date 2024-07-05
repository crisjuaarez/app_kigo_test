import 'package:app_kigo_test/src/features/products/ui/widgets/cart_counter.dart';
import 'package:flutter/material.dart';

import '../../../../../../ui/theme/app_theme.dart';
import '../../../../../home/ui/screens/widgets/float_cart_button.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const BackButton(color: AppTheme.secondaryColor),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const CartModalSheet(),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppTheme.secondaryColor,
              ),
            ),
            const CartCounter(),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
