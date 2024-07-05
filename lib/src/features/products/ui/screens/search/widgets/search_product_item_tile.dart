import 'package:flutter/material.dart';

import '../../../../../../ui/theme/app_theme.dart';
import '../../../../domain/entities/product.dart';
import '../../../widgets/product_image.dart';

class SearchProductItemTile extends StatelessWidget {
  const SearchProductItemTile({super.key, required this.product, this.onTap});

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 55,
      leading: ClipOval(
        child: ProductImage(
          product: product,
          height: 55,
          width: 55,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(product.title, maxLines: 1),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppTheme.secondaryColor,
      ),
    );
  }
}
