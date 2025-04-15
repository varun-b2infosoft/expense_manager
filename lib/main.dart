import 'package:flutter/material.dart';
import 'package:expense_tracker_app/constants/theme.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_provider.dart';

void main() {
  runApp(MyApp());   
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        // Add more providers here
      ],
      child: MaterialApp(
        title: 'FinTrack',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}
