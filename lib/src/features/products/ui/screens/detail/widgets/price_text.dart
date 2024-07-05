import 'package:flutter/material.dart';

import '../../../../domain/entities/product.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
