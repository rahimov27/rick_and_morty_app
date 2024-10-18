import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/presentation/screens/splash_screen.dart';
import 'package:rick_and_morty_app/presentation/theme/theme_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: context.watch<ThemeProvider>().theme,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
