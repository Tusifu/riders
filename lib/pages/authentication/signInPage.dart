import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/pages/authentication/signUpPage.dart';
import 'package:riders/providers/authProvider.dart';
import 'package:riders/utilities/constants.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/signInPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({super.key});

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
      body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bigSpacing,
              const Text(
                'Sign in with your email or phone number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bigSpacing,
              TTextField(
                labelText: 'Email',
                controller: emailController,
                isEmail: true,
              ),
              normalSpacing,
              TTextField(
                labelText: 'Enter Your Password',
                isPassword: true,
                controller: passwordController,
              ),
              normalSpacing,
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget password ?",
                    style: TextStyle(
                      color: errorColor,
                    ),
                  )
                ],
              ),
              bigSpacing,
              TButton(
                label: 'Sign In',
                onPressed: () async {
                  authProvider.login(
                      emailController.text, passwordController.text, context);
                },
              ),
              bigSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 1,
                    color: lightGray,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Container(
                    width: 160,
                    height: 1,
                    color: lightGray,
                  ),
                ],
              ),
              extraBigSpacing,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.routeName);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
