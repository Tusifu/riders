import 'package:flutter/material.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/pages/authentication/signUpPage.dart';
import 'package:riders/utilities/constants.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcomePage';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 90),
          Image.asset(
            "assets/images/welcome.png",
            height: 250,
          ),
          veryBigSpacing,
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          normalSpacing,
          Text(
            "Have a better sharing experience",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 170),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                normalSpacing,
                TButton(
                  label: "Create an account",
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
                  },
                ),
                normalSpacing,
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.routeName);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: primaryColor),
                  ),
                  child: const Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 16, color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
