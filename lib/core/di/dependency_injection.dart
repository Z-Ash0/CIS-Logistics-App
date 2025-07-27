import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/core/newtorking/dio_factory.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/features/authentication/data/repository/auth_repository.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/theme/data/theme_service.dart';
import 'package:cis_logistics_app/features/theme/logic/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> setupDependencies() async {
  //* Local Storage
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  await getIt<StorageService>().init();

  //* ApiService
  Dio dio = DioFactory.getDio();
  final baseUrl = dotenv.env['BASE_URL'];
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio, baseUrl: baseUrl),
  );

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
