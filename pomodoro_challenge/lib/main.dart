import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFDD4B38),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
