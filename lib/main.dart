import 'package:flutter/material.dart';
import 'package:fractalize/screens/home.dart';

void main() {
  runApp(const Fractalize());
}

class Fractalize extends StatelessWidget {
  const Fractalize({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'explore fractals',
      home: const HomeScreen(),
    );
  }
}
