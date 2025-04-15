import 'package:expense_tracker_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03), // 3%
                Center(
                  child: Column(
                    children: [
                      Text(
                        'WELCOME BACK!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // 1%
                      Text('Enter your credentials to login'),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.08), // 8%
                CustomInput(hintText: 'Email', obscure: false),
                SizedBox(height: screenHeight * 0.03), // 3%
                CustomInput(hintText: 'Password', obscure: true),
                SizedBox(height: screenHeight * 0.08), // 8%
                Center(
                  child: ElevatedButton(onPressed: () {}, child: Text('Login')),
                ),
                SizedBox(height: screenHeight * 0.015), // 1.5%
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.10), // 10%
                Center(child: Text('Or')),
                SizedBox(height: screenHeight * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/images/google_icon.png',
                          height: 25,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/images/microsoft_icon.png',
                          height: 25,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/images/facebook_icon.png',
                          height: 25,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
