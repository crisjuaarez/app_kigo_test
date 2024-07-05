import 'package:flutter/material.dart';

import '../../../../domain/entities/product.dart';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.description,
      maxLines: 5,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }
}
