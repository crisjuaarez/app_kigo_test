import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' hide Category;

import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/shop_repository.dart';

class ProductsProvider with ChangeNotifier {
  final ProductsRepository productsRepository;
  ProductsProvider({required this.productsRepository});

  List<Product> _allProducts = [];
  List<Product> get allProducts => _allProducts;

  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;
  List<Category> categories = [];
  late Category _selectedCategory;
  Category get selectedCategory => _selectedCategory;
  set selectedCategory(Category value) {
    _selectedCategory = value;
    _filterProducts();
    notifyListeners();
  }

  void _filterProducts() {
    if (_selectedCategory.name == 'Todos') {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts
          .where((p) => p.category == _selectedCategory.name)
          .toList();
    }
  }

  Failure? failure;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Either<Failure, List<Product>>> getProducts() async {
    setLoading(true);
    final either = await productsRepository.getProducts();
    either.fold(
      (l) {
        failure = l;
      },
      (r) {
        failure = null;
        _allProducts = r;
        _filteredProducts = r;
        _getCategories();
      },
    );
    setLoading(false);
    return either;
  }

  void _getCategories() async {
    categories.clear();
    categories.add(const Category(name: 'Todos'));
    _selectedCategory = categories.first;
    for (final product in _filteredProducts) {
      final category = Category(name: product.category);
      final categoryExists = categories.any((c) => c.name == product.category);
      if (!categoryExists) categories.add(category);
    }
  }
}
