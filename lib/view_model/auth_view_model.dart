import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imdb_app/utils/routes/route_name.dart';
import 'package:imdb_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Utils.snackbar('Sign Up successful ', context);
      Navigator.pushNamed(context, RoutesName.login);

      return userCredential;
    } catch (e) {
      return Utils.snackbar('Sign Up error : $e ', context);
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      _saveLoggedInStatus(true);
      print(userCredential);

      Utils.snackbar('Sign in successful ', context);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (Route<dynamic> route) => false);

      return userCredential;
    } catch (e) {
      return Utils.snackbar('Sign in error : $e ', context);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut().then((value) => _saveLoggedInStatus(false));
      Utils.snackbar('Sign Out Successful', context);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (route) => false);
    } catch (e) {
      Utils.snackbar('error: $e ', context);
    }
  }

  Future<void> _saveLoggedInStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> getLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
