import 'package:cis_logistics_app/core/routes/routes.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MaterialApp(
      title: 'CIS Logistikawy',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.getRoute,
      initialRoute: Routes.onBoardingScreen,
    );
  }
}
