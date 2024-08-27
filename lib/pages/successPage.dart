import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/pages/complaintPage.dart';
import 'package:riders/utilities/constants.dart';

class Successpage extends StatelessWidget {
  static const String routeName = '/successPage';
  const Successpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leadingWidth: 100,
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: const CustomBackButton(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                extraBigSpacing,
                Image.asset(
                  "assets/images/success.png",
                  width: 124,
                  height: 124,
                ),
                bigSpacing,
                const Text(
                  "Thank you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                normalSpacing,
                const Text(
                  "Your booking has been placed sent to Md. sharif Ahmed",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                TButton(
                    label: "Please feedback",
                    onPressed: () {
                      Navigator.pushNamed(context, ComplaintPage.routeName);
                    }),
                bigSpacing,
              ],
            ),
          ),
        ));
  }
}
