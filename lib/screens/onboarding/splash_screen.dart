import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:expense_tracker_app/constants/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('onboarding_done') ?? false;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(
      const Duration(seconds: 1),
    ); //duration of splash screen

    if (!isFirstTime) {
      Navigator.pushReplacementNamed(context, '/getStarted');
    } else if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // You can add home screen here if user already logged in
      Navigator.pushReplacementNamed(context, '/login'); // just for now
    }
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo here
            Image.asset('assets/images/logo.png', height: 150),
            // const SizedBox(height: 20),
            // Text('FinTrack', style: textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
