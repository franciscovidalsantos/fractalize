import 'package:flutter/material.dart';

class FractalizeBottomNavigationBar extends StatefulWidget {
  const FractalizeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  State<FractalizeBottomNavigationBar> createState() =>
      _FractalizeBottomNavigationBarState();
}

class _FractalizeBottomNavigationBarState
    extends State<FractalizeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      currentIndex: widget.currentIndex,
      backgroundColor: Colors.indigoAccent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showUnselectedLabels: false,
      onTap: widget.onItemTapped,
    );
  }
}
