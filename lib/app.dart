import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/onboarding.dart';
import 'package:hausify_v2/utils/theme/theme.dart';


/// -- Use this class to setup themes, initial bindings, any animations and other things
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}