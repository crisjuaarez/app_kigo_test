import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../../widgets/product_image.dart';
import 'widgets/product_detail_app_bar.dart';
import 'widgets/product_detail_card.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ProductImage(product: product),
          ),
          Expanded(
            flex: 3,
            child: ProductDetailCard(product: product),
          ),
        ],
      ),
    );
  }
}
