import 'package:get_it/get_it.dart';
import 'features/signin/data/datasources/signin_remote_data_source.dart';
import 'features/signin/data/datasources/signin_remote_data_source_impl.dart';
import 'features/signin/data/repositories/signin_repository_impl.dart';
import 'features/signin/domain/repositories/signin_repository.dart';
import 'features/signin/domain/usecases/signin_use_case.dart';
import 'features/signin/presentation/cubit/signin_cubit.dart';
import 'features/signup/data/datasources/signup_remote_data_source.dart';
import 'features/signup/data/datasources/signup_remote_data_source_impl.dart';
import 'features/signup/data/repositories/signup_repository_impl.dart';
import 'features/signup/domain/repositories/signup_repository.dart';
import 'features/signup/domain/usecases/signup_use_case.dart';
import 'features/signup/presentation/cubit/signup_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ---------------------------------------------------------------------------
  // Features - Sign In
  // ---------------------------------------------------------------------------
  // Cubit
  sl.registerFactory(() => SigninCubit(signinUseCase: sl()));

  // UseCases
  sl.registerLazySingleton(() => SigninUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SigninRepository>(
    () => SigninRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SigninRemoteDataSource>(
    () => SigninRemoteDataSourceImpl(),
  );

  // ---------------------------------------------------------------------------
  // Features - Sign Up
  // ---------------------------------------------------------------------------
  // Cubit
  sl.registerFactory(() => SignupCubit(signupUseCase: sl()));

  // UseCases
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SignupRemoteDataSource>(
    () => SignupRemoteDataSourceImpl(),
  );
}
