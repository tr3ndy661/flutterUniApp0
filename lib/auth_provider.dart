// connect this to the auth.dart file and use it in the login page
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/auth.dart'; // Adjust the import based on your project structure
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

// This code defines an AuthProvider class that uses the AuthService to handle user authentication.
// It provides methods to sign in and sign out, and notifies listeners when the authentication state
