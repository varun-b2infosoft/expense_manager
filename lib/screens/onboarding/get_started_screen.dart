import 'package:expense_tracker_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.30), // Top spacing (30%)
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: screenHeight * 0.22,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                // child: CustomButton(onTap: () => completeOnboarding(context)),
                child: CustomButton(
                  onTap:
                      () => Navigator.pushReplacementNamed(
                        context,
                        '/onboarding',
                      ),
                ),
              ),
              SizedBox(height: screenHeight * 0.15), // Bottom spacing (5%)
            ],
          ),
        ),
      ),
    );
  }
}
