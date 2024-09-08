import 'package:either_dart/either.dart';
import 'package:flutter_bloc_clean_arch/core/error/exception.dart';
import 'package:flutter_bloc_clean_arch/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<Either<ServerException, UserModel>> signupWithEmailPassword(
      {required String name, required String email, required String password});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl({required this.supabaseClient});
  @override
  Future<Either<ServerException, UserModel>> signupWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});

      if (response.user == null) {
        throw ServerException(message: 'User not found');
      }

      return Right(UserModel.fromJson({
        'id': response.user?.id,
        'name': response.user?.email,
        'email': response.user?.email
      }));
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }
}
