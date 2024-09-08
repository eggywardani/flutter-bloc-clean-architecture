import 'package:either_dart/either.dart';
import 'package:flutter_bloc_clean_arch/core/error/failure.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signupWithEmailPassword(
      {required String name, required String email, required String password});
}
