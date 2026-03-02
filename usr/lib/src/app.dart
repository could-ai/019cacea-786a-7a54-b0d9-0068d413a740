import 'package:flutter/material.dart';
import 'package:couldai_user_app/src/theme/app_theme.dart';
import 'package:couldai_user_app/src/features/home/presentation/home_screen.dart';
import 'package:couldai_user_app/src/features/auth/presentation/login_screen.dart';

class CouldAIApp extends StatelessWidget {
  const CouldAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CouldAI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
