import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/failure.dart';
import '../entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProduct(String id);
}
