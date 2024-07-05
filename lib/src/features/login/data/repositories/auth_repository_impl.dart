import 'dart:convert';

import 'package:dartz/dartz.dart' show Either, Left, Right;

import '../../../../core/constants/app_strings.dart';
import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final response = await authDataSource.signIn(email, password);
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) return Right(UserModel.fromJson(body));
      return Left(Failure(message: body['message'] ?? AppStrings.loginError));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
