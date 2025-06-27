// when the user opens the app, they should be able to log in with their email and password
// if the user is not logged in, they should be redirected to the login page
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/auth_provider.dart'; // Adjust the import based on your project structure
import 'package:ecommerce_app/homepage.dart'; // Adjust the import based on your project structure
import 'package:ecommerce_app/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signOut(); // Always sign out on app start
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Example',
      home: StreamProvider<User?>(
        create: (context) => FirebaseAuth.instance.authStateChanges(),
        initialData: null,
        child: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
// This code initializes Firebase and sets up a simple authentication flow using Provider.
// It listens to authentication state changes and redirects the user to either a login page or a home page based on their authentication status.

// create a simple login page that uses Firebase Auth
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
// This class provides methods to sign in with email and password and to sign out.
// It uses Firebase Auth to handle the authentication process.