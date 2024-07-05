import 'package:equatable/equatable.dart';

import 'product.dart';

class CartProduct extends Product with EquatableMixin {
  int quantity;

  CartProduct({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];

  void incrementQuantity() => quantity++;

  void decrementQuantity() {
    if (quantity == 1) return;
    quantity--;
  }

  CartProduct copyWith({
    int? quantity,
  }) {
    return CartProduct(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
      quantity: quantity ?? this.quantity,
    );
  }
}
