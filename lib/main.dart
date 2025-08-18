import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/routes/routes.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/theme/logic/theme_cubit.dart';
import 'package:cis_logistics_app/features/theme/presentation/theme_data_dark.dart';
import 'package:cis_logistics_app/features/theme/presentation/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await setupDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const CISLogistics());
  });
}

class CISLogistics extends StatelessWidget {
  const CISLogistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (_, newTheme) => MaterialApp(
          title: 'CIS Logistikawy',
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: newTheme,
          onGenerateRoute: AppRoutes().getRoute,
          initialRoute: _getInitialRoute(),
        ),
      ),
    );
  }

  String _getInitialRoute() {
    return getIt<StorageService>().isFirstTime
        ? Routes.onBoardingScreen
        : getIt<StorageService>().isLoggedIn
        ? Routes.mainPageScreen
        : Routes.signInScreen;
  }
}
