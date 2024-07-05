import 'package:flutter/material.dart';

import '../../../../domain/entities/product.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
