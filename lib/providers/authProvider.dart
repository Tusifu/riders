import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riders/models/userModel.dart';
import 'package:riders/pages/authentication/signInPage.dart';
import 'package:riders/pages/homePage.dart';

class AuthProvider extends ChangeNotifier {
  final _preferences = SharedPreferences.getInstance();
  UserData? _userData;
  bool _isLoggedIn = false;

  UserData? get userData => _userData;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> saveUserData(
    String name,
    String email,
    String phoneNumber,
    String gender,
  ) async {
    final userData = UserData(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      gender: gender,
    );
    final prefs = await _preferences;
    await prefs.setString('userData', jsonEncode(userData.toJson()));
    _userData = userData;
    notifyListeners();
  }

  Future<bool> completeSignup(String password) async {
    final prefs = await _preferences;
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = UserData.fromJson(jsonDecode(userDataJson));
      final updatedUserData = userData.copyWith(password: password);
      await prefs.setString('userData', jsonEncode(updatedUserData.toJson()));

      // Update login state
      _userData = updatedUserData;
      _isLoggedIn = true;
      notifyListeners();
      return true;
    } else {
      print("========> error (user data not found)");
      // Handle error (user data not found)
      return false;
    }
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    final prefs = await _preferences;
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = UserData.fromJson(jsonDecode(userDataJson));

      if (userData.email == email && userData.password == password) {
        _userData = userData;
        _isLoggedIn = true;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (Route<dynamic> route) => false,
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Login Error'),
            content: const Text('Incorrect email or password.'),
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
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Login Error'),
          content: const Text('User not found.'),
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
  }

  Future<void> logout(BuildContext context) async {
    // final prefs = await _preferences;
    // await prefs.remove('userData');
    _userData = null;
    _isLoggedIn = false;
    notifyListeners();
    Navigator.pushReplacementNamed(context, SignInPage.routeName);
  }
}
