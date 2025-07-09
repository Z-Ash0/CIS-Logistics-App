import 'package:cis_logistics_app/core/routes/routes.dart';
import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const CISLogistics(),
    ),
  );
}

class CISLogistics extends StatelessWidget {
  const CISLogistics({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MaterialApp(
      title: 'CIS Logistikawy',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.getRoute,
      initialRoute: HiveService.isFirstTime.get(HiveKeys.kIsFirstTime) ?? true
          ? Routes.onBoardingScreen
          : Routes.signInScreen,
    );
  }
}
