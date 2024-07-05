import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/theme/app_theme.dart';
import '../providers/cart_provider.dart';

enum CartCounterStyle { primary, secondary }

class CartCounter extends StatelessWidget {
  const CartCounter({super.key, this.style = CartCounterStyle.primary});

  final CartCounterStyle style;

  @override
  Widget build(BuildContext context) {
    final isPrimaryStyle = style == CartCounterStyle.primary;
    return IgnorePointer(
      ignoring: true,
      child: Consumer<CartProvider>(
        builder: (_, provider, __) {
          if (provider.cart.isEmpty) return const SizedBox.shrink();
          return Container(
            decoration: BoxDecoration(
              color: isPrimaryStyle ? AppTheme.primaryColor : Colors.white,
              shape: BoxShape.circle,
              border: isPrimaryStyle
                  ? null
                  : Border.all(color: AppTheme.primaryColor, width: 1),
            ),
            padding: const EdgeInsets.all(4),
            child: Text(
              '${provider.cart.length}',
              style: TextStyle(
                color: isPrimaryStyle ? Colors.white : AppTheme.primaryColor,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}
