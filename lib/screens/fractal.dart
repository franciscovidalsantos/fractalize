import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';

class FractalScreen extends StatefulWidget {
  const FractalScreen({super.key, required this.fractalType});
  final FractalType fractalType;

  @override
  State<FractalScreen> createState() => _FractalScreenState();
}

class _FractalScreenState extends State<FractalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          widget.fractalType.info.label.toLowerCase(),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
