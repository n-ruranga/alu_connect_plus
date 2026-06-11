import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/onboarding/landing_screen.dart';

void main() {
  runApp(const AluConnectApp());
}

class AluConnectApp extends StatelessWidget {
  const AluConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALU Connect+',
      theme: AppTheme.darkTheme,
      home: const LandingScreen(),
    );
  }
}