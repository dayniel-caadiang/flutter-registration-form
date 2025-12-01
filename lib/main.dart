import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RegistrationFormApp());
}

class RegistrationFormApp extends StatelessWidget {
  const RegistrationFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}