import 'package:flutter/material.dart';
import 'package:hausify_v2/utils/theme/theme.dart';


/// -- Use this class to setup themes, initial bindings, any animations and other things
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
    );
  }
}