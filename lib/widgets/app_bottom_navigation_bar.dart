import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
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
      showSelectedLabels: true,
      onTap: widget.onItemTapped,
    );
  }
}
