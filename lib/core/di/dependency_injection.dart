import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/core/newtorking/dio_factory.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/features/authentication/data/repository/auth_repository.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/profile/data/model/user.dart';
import 'package:cis_logistics_app/features/theme/data/theme_service.dart';
import 'package:cis_logistics_app/features/theme/logic/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.I;

Future<void> setupDependencies() async {
  //* Local Storage
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  await getIt<StorageService>().init();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserDataAdapter());
  }

  //* ApiService
  final baseUrl = dotenv.env['BASE_URL'];
  if (baseUrl != null) {
    getIt.registerLazySingleton<DioFactory>(() => DioFactory(baseUrl));
    getIt.registerLazySingleton<Dio>(() => getIt<DioFactory>().getDio());
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(getIt<Dio>(), baseUrl: baseUrl),
    );
  }

  //* Auth
  // AuthRepository injection
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

  // AuthCubit injection
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  //* Theme
  // ThemeService injection
  getIt.registerLazySingleton<ThemeService>(() => ThemeService());
  // ThemeCubit injection
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()));
}
