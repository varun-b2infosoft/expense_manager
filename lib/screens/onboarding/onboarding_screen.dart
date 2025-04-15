import 'package:expense_tracker_app/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void initState() {
    super.initState();

    // Delay this so context is ready
    Future.microtask(() {
      Provider.of<OnboardingProvider>(context, listen: false).resetPage();
    });
  }

  void completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);
    Navigator.pushReplacementNamed(context, '/login');
  }

  final List<Map<String, String>> onboardingData = const [
    {
      'title': 'Track every penny effortlessly',
      'subtitle':
          'Easily upload receipts and enter your expenses in one single tap',
      'image': 'assets/images/illustration1.svg',
    },
    {
      'title': 'Visualize your finances',
      'subtitle':
          'Picturize your income and expenses with intuitive, easy to read charts.',
      'image': 'assets/images/illustration2.svg',
    },
    {
      'title': 'Set your savings goal',
      'subtitle': 'Create saving goals that fit your lifestyle and priorities.',
      'image': 'assets/images/illustration3.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);

    // Reset to first page every time
    final screenHeight = MediaQuery.of(context).size.height;
    final isLast = provider.currentPage == onboardingData.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Row
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/getStarted');
                    },
                  ),

                  // Skip Button
                  TextButton(
                    onPressed: () => completeOnboarding(context),
                    child: const Text("Skip"),
                  ),
                ],
              ),
            ),

            // Your existing content continues...
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(
                              0.2,
                              0,
                            ), // slight slide from right
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      key: ValueKey<int>(provider.currentPage),
                      children: [
                        SvgPicture.asset(
                          onboardingData[provider.currentPage]['image']!,
                          height: screenHeight * 0.4,
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            onboardingData[provider.currentPage]['subtitle']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Button
                        ElevatedButton(
                          onPressed: () {
                            isLast
                                ? completeOnboarding(context)
                                : provider.nextPage();
                          },
                          child: Text(isLast ? 'Login' : 'Next'),
                        ),

                        if (isLast)
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text("Don't have an account? Sign up"),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Dots stay outside switcher (smooth fluid animation)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingData.length, (index) {
                      bool isActive = provider.currentPage == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: isActive ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              isActive
                                  ? Colors.deepPurple
                                  : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
