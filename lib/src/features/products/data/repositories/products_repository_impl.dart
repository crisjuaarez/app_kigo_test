import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/shop_repository.dart';
import '../data_source/products_data_source.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDataSource dataSource;

  ProductsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    try {
      final response = await dataSource.getProducts();
      final body = json.decode(response.body);
      log('getProductsBody: $body');

      if (response.statusCode == 200) return Right(ProductModel.fromJson(body));
      return Left(
        Failure(message: body['message'] ?? 'Error al obtener producto'),
      );
    } catch (e) {
      log('getProductError: $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await dataSource.getProducts();
      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        final listBody = body as List;
        final products = listBody.map((p) => ProductModel.fromJson(p)).toList();
        return Right(products);
      }
      return Left(
        Failure(message: body['message'] ?? 'Error al obtener productos'),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
