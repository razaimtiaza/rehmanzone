import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticatioProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<String?> login(String email, String password) async {
    try {
      _setLoading(true);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setLoading(false);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      if (e.code == 'user-not-found') {
        return 'No account found. Please register first.';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password.';
      }
      return e.message;
    } catch (e) {
      _setLoading(false);
      return 'An error occurred. Please try again.';
    }
  }

  Future<String?> register(String email, String password) async {
    try {
      _setLoading(true);
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      if (e.code == 'email-already-in-use') {
        return 'Account already exists. Try logging in.';
      } else if (e.code == 'weak-password') {
        return 'Password should be at least 6 characters.';
      }
      return e.message;
    } catch (e) {
      _setLoading(false);
      return 'An error occurred. Please try again.';
    }
  }
}
