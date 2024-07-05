import 'cart_product.dart';
import 'rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  CartProduct to() => CartProduct(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: rating,
        quantity: 1,
      );
}
