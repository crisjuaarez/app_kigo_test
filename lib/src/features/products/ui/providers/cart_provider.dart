import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/cart_product.dart';

class CartProvider with ChangeNotifier {
  final List<CartProduct> _cart = [];
  List<CartProduct> get cart => _cart;

  int get cartSize => _cart.length;

  double get totalPrice => _cart.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity,
      );

  void addToCart(CartProduct product) {
    if (_cart.any((p) => p.id == product.id)) {
      final index = _cart.indexWhere((p) => p.id == product.id);
      _cart[index].incrementQuantity();
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQuantity(CartProduct product) {
    final index = _cart.indexWhere((p) => p.id == product.id);
    _cart[index].incrementQuantity();
    notifyListeners();
  }

  void decrementQuantity(CartProduct product) {
    final index = _cart.indexWhere((p) => p.id == product.id);
    _cart[index].decrementQuantity();
    notifyListeners();
  }

  void removeFromCart(CartProduct product) {
    _cart.remove(product);
    notifyListeners();
  }
}
