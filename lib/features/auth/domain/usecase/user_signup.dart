import 'package:either_dart/either.dart';
import 'package:flutter_bloc_clean_arch/core/error/failure.dart';
import 'package:flutter_bloc_clean_arch/core/usecase/usecase.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/entities/user.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/repositories/auth_repository.dart';

class UserSignup implements Usecase<User, UserSignupParams> {
  final AuthRepository authRepository;
  UserSignup({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(UserSignupParams params) {
    return authRepository.signupWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams(
      {required this.name, required this.email, required this.password});
}
