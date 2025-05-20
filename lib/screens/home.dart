import 'package:flutter/material.dart';
import 'package:fractalize/widgets/app_bottom_navigation_bar.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("fractalize", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // TODO: open a dialog with info about the page.
            },
          ),
        ],
      ),
      body: FractalsList(),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
