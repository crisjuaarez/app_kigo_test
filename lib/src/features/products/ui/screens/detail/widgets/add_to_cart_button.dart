import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../ui/widgets/button/my_button.dart';
import '../../../../../home/ui/screens/widgets/float_cart_button.dart';
import '../../../../domain/entities/cart_product.dart';
import '../../../providers/cart_provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});

  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      text: 'Agregar al carrito',
      onPressed: () {
        context.read<CartProvider>().addToCart(product.to());
        showModalBottomSheet(
          context: context,
          builder: (_) => const CartModalSheet(),
        );
      },
    );
  }
}
