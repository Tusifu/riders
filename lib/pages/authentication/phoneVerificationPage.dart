import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/pages/authentication/setPasswordPage.dart';
import 'package:riders/utilities/constants.dart';
import 'package:pinput/pinput.dart'; // Use Pinput package for a custom OTP field

class PhoneVerificationPage extends StatelessWidget {
  static const String routeName = '/phoneVerificationPage';

  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.grey.shade200,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          leadingWidth: 200.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const CustomBackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Phone verification",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Enter your OTP code",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 32),
            Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              showCursor: true,
              onChanged: (value) {
                // Handle pin input change
              },
              onCompleted: (pin) {
                // Handle completion of pin entry
              },
            ),
            bigSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive code?"),
                TextButton(
                  onPressed: () {
                    // Handle resend code action
                  },
                  child: const Text(
                    "Resend again",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            const Spacer(),
            TButton(
              label: "Verify",
              onPressed: () {
                Navigator.pushNamed(context, SetPasswordPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
