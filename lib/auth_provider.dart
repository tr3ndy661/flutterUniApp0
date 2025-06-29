
import 'package:flutter/material.dart';
import 'package:ecommerce_app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<User?> signIn(String email, String password) async {
    return await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
