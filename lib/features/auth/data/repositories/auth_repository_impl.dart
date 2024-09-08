import 'package:either_dart/either.dart';
import 'package:flutter_bloc_clean_arch/core/error/exception.dart';
import 'package:flutter_bloc_clean_arch/core/error/failure.dart';
import 'package:flutter_bloc_clean_arch/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/entities/user.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  AuthRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, User>> signupWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await remoteDatasource.signupWithEmailPassword(
          name: name, email: email, password: password);

      return Right(user.right);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
