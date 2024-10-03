import 'package:flutter/material.dart';
import 'package:formz_validation/signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
