import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/utilities/constants.dart';

class SetPasswordPage extends StatelessWidget {
  static const String routeName = '/setPasswordPage';

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bigSpacing,
            const Center(
              child: Text(
                'Set New Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            smallSpacing,
            const Center(
              child: Text(
                'Set your new assword',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            bigSpacing,
            TTextField(
              labelText: 'Enter Your New Password',
              controller: passwordController,
              isPassword: true,
            ),
            normalSpacing,
            TTextField(
                labelText: 'ConfirmPassword',
                isPassword: true,
                controller: passwordConfirmController,
                customErrorMessage:
                    passwordController.text == passwordConfirmController.text
                        ? "Passwords has to match"
                        : ""),
            extraBigSpacing,
            TButton(
              label: 'Save',
              onPressed: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
