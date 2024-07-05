import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/app_dimens.dart';
import '../../../providers/products_provider.dart';
import 'product_widget.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (_, notifier, __) {
        final products = notifier.filteredProducts;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppDimens.defaultPaddingValue,
            crossAxisSpacing: AppDimens.defaultPaddingValue,
            mainAxisExtent: 300,
          ),
          padding: AppDimens.defaultAllPadding,
          itemCount: products.length,
          itemBuilder: (_, i) => ProductWidget(product: products[i]),
        );
      },
    );
  }
}
