import 'package:flutter/material.dart';
import 'package:fractalize/screens/home.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // enable screen to always stay on with Wakelock
  WakelockPlus.enable();
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
