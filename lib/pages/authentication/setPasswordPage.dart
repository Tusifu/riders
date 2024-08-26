import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/providers/authProvider.dart';
import 'package:riders/utilities/constants.dart';

class SetPasswordPage extends StatefulWidget {
  static const String routeName = '/setPasswordPage';

  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmController =
      TextEditingController();

  bool _hasError = false;

  bool _isFocused = false;

  bool _isObscured = true;

  final _focusNode = FocusNode();

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
        final userData = authProvider.userData;
        if (userData == null) {
          print("No User Data");
        } else {
          print(userData.toJson().toString());
        }
        return Padding(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _focusNode.requestFocus();
                    },
                    child: Stack(
                      children: [
                        CupertinoTextField(
                          controller: passwordConfirmController,
                          obscureText: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          placeholder: _isFocused ||
                                  passwordConfirmController.text.isNotEmpty
                              ? null
                              : "Confirm Password",
                          suffix: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              !_isObscured
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: _hasError
                                  ? errorColor
                                  : _isFocused
                                      ? primaryColor
                                      : CupertinoColors.lightBackgroundGray,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _hasError = _validate(value);
                            });
                          },
                          focusNode: _focusNode, // Attach FocusNode
                        ),
                        Positioned(
                          top: passwordConfirmController.text.isNotEmpty
                              ? 0
                              : 16,
                          left: 12,
                          child: AnimatedOpacity(
                            opacity: _isFocused ||
                                    passwordConfirmController.text.isNotEmpty
                                ? 1.0
                                : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "Confirm Password",
                                style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontSize: _isFocused ||
                                          passwordConfirmController
                                              .text.isNotEmpty
                                      ? 12
                                      : 16,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_hasError)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Password has to match',
                        style: TextStyle(
                          color: errorColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              extraBigSpacing,
              TButton(
                label: 'Save',
                onPressed: () async {
                  bool response = await authProvider
                      .completeSignup(passwordController.text);
                  if (response == true) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInPage.routeName,
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Sign up Error'),
                        content: const Text(
                            'Fail to create your account, try again.'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool _validate(String value) {
    if (value != passwordController.text) {
      return true;
    } else {
      return false;
    }
  }
}
