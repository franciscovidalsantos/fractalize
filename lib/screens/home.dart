import 'package:flutter/material.dart';
import 'package:fractalize/navigation/fractalize_app_bar.dart';
import 'package:fractalize/navigation/fractalize_bottom_navigation_bar.dart';
import 'package:fractalize/widgets/fractals_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FractalizeAppBar(title: "fractalize"),
      body: FractalsList(),
      bottomNavigationBar: FractalizeBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
