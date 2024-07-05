import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
    this.height,
    this.width,
    this.fit = BoxFit.fitWidth,
  });

  final Product product;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: Image.network(
        product.image,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
