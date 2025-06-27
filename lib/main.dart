import 'package:ecommerce_app/auth.dart' show AuthWrapper;
import 'package:ecommerce_app/productpage.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
// import 'package:ecommerce_app/providers/cart_provider.dart'
import 'package:ecommerce_app/providers/likes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app/auth_provider.dart';
import 'package:ecommerce_app/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => LikesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: AuthWrapper(),
          routes: {'/home': (context) => HomePage()},
        );
      },
    );
  }
}
