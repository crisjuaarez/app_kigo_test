import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_dimens.dart';
import '../../../../domain/entities/product.dart';
import 'add_to_cart_button.dart';
import 'price_text.dart';
import 'product_description_text.dart';
import 'product_title_text.dart';

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    const padding = AppDimens.defaultPaddingValue * 1.5;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(
          AppDimens.defaultModalBorderRadiusValue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ProductTitleText(product: product),
              ),
              Expanded(
                flex: 3,
                child: ProductDescriptionText(product: product),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    PriceText(product: product),
                    AppDimens.hSeparator,
                    Expanded(
                      child: AddToCartButton(product: product.to()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
