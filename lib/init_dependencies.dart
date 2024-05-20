import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentataion/bloc/auth_bloc.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuthDependncy();

  final url = dotenv.env['SUPA_BASE_URL'];
  final anonKey = dotenv.env['anon_key'];

  final supabase = await Supabase.initialize(
    url: url!,
    anonKey: anonKey!,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuthDependncy() {
  serviceLocator
    //auth data surce
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serviceLocator()))

//repository
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    //user sign up use case.
    ..registerFactory(() => UserSignUpuseCase(serviceLocator()))
    ..registerFactory(() => AuthBloc(userSignUp: serviceLocator()));
}
