import 'package:flutter_bloc_clean_arch/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_bloc_clean_arch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc_clean_arch/features/auth/domain/usecase/user_signup.dart';
import 'package:flutter_bloc_clean_arch/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secret/app_secret.dart';
import 'features/auth/domain/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  // Services

  final supabase = await Supabase.initialize(
      url: AppSecret.supabaseUrl, anonKey: AppSecret.supabaseAnnonKey);
  sl.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  sl
    ..registerFactory<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(supabaseClient: sl()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(remoteDatasource: sl()))
    ..registerFactory(() => UserSignup(authRepository: sl()))
    ..registerFactory(() => AuthBloc(userSignup: sl()));
}
