import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_dimens.dart';
import '../../../../domain/entities/product.dart';
import '../../detail/product_detail_screen.dart';
import 'search_product_item_tile.dart';

class SearchProductList extends StatelessWidget {
  const SearchProductList({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      padding: AppDimens.defaultAllPadding,
      itemBuilder: (_, i) {
        final product = products[i];
        return SearchProductItemTile(
          product: product,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(product: product),
              ),
            );
          },
        );
      },
    );
  }
}
