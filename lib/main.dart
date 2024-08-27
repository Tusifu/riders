import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/pages/authentication/phoneVerificationPage.dart';
import 'package:riders/pages/authentication/setPasswordPage.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/pages/authentication/signUpPage.dart';
import 'package:riders/pages/availableCarsPage.dart';
import 'package:riders/pages/homePage.dart';
import 'package:riders/pages/onboadingPage.dart';
import 'package:riders/pages/transportSelectionPage.dart';
import 'package:riders/pages/welcomePage.dart';
import 'package:riders/providers/authProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
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
          SetPasswordPage.routeName: (context) => const SetPasswordPage(),
          AvailableCarsPage.routeName: (context) => const AvailableCarsPage(),
          TransportSelectionPage.routeName: (context) =>
              const TransportSelectionPage(),
        },
        home: const AvailableCarsPage(),
      ),
    );
  }
}
