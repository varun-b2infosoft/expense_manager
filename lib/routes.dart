import 'package:expense_tracker_app/screens/onboarding/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/screens/auth/login_screen.dart';
import 'package:expense_tracker_app/screens/auth/signup_screen.dart';
import 'package:expense_tracker_app/screens/onboarding/onboarding_screen.dart';
import 'package:expense_tracker_app/screens/onboarding/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String getStarted = '/getStarted';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    getStarted: (context) => const GetStartedScreen(),
    onboarding: (context) => const OnboardingScreen(),
    login: (context) => LoginScreen(),
    register: (context) => const RegisterScreen(),
  };
}
