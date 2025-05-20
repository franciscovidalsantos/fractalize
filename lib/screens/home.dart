import 'package:flutter/material.dart';
import 'package:fractalize/widgets/fractals_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("fractalize", style: TextStyle(color: Colors.white)),
      ),
      body: FractalsList(),
    );
  }
}
