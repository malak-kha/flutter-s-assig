import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(const AnimalSoundsApp());
}

class AnimalSoundsApp extends StatelessWidget {
  const AnimalSoundsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
