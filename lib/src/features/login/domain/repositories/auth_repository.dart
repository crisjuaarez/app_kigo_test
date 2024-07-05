import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<void> signOut();
}
