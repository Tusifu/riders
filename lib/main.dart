import 'package:flutter/material.dart';
import 'package:riders/pages/authentication/phoneVerificationPage.dart';
import 'package:riders/pages/authentication/setPasswordPage.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/pages/authentication/signUpPage.dart';
import 'package:riders/pages/homePage.dart';
import 'package:riders/pages/onboadingPage.dart';
import 'package:riders/pages/transportSelectionPage.dart';
import 'package:riders/pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'riders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        WelcomePage.routeName: (context) => const WelcomePage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        PhoneVerificationPage.routeName: (context) =>
            const PhoneVerificationPage(),
        SignInPage.routeName: (context) => SignInPage(),
        HomePage.routeName: (context) => HomePage(),
        SetPasswordPage.routeName: (context) => SetPasswordPage(),
        TransportSelectionPage.routeName: (context) =>
            const TransportSelectionPage(),
      },
      home: const OnboardingPage(),
    );
  }
}
