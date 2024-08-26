import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TPickerField.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/components/TPhoneNumberField.dart';
import 'package:riders/pages/authentication/phoneVerificationPage.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/providers/authProvider.dart';
import 'package:riders/utilities/constants.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signUpPage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bigSpacing,
            const Text(
              'Sign up with your email or phone number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            veryBigSpacing,
            TTextField(
              labelText: 'Name',
              controller: nameController,
            ),
            normalSpacing,
            TTextField(
              labelText: 'Email',
              controller: emailController,
              isEmail: true,
            ),
            normalSpacing,
            TPhoneNumberField(
              controller: phoneController,
              labelText: "Your mobile number",
              initialCountryCode: "RW",
            ),
            normalSpacing,
            TPickerField(
              labelText: "Gender",
              onChanged: (value) {
                print("Changed to $value");
              },
              options: const ["Male", "Female"],
              suffixIcon: const Icon(CupertinoIcons.chevron_down),
              controller: genderController,
            ),
            normalSpacing,
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: primaryColor,
              title: const Text(
                  'By signing up, you agree to the Terms of service and Privacy policy.'),
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
            normalSpacing,
            TButton(
              isDisabled: !_agreeToTerms,
              label: 'Sign Up',
              onPressed: () async {
                // Implement sign-up logic here

                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                await authProvider.saveUserData(
                  nameController.text,
                  emailController.text,
                  phoneController.text,
                  genderController.text,
                );

                Navigator.pushNamed(context, PhoneVerificationPage.routeName);
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
            bigSpacing,
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignInPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInPage.routeName);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
