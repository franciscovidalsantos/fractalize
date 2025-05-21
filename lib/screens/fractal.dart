import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/navigation/fractalize_app_bar.dart';

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
      appBar: FractalizeAppBar(
        title: widget.fractalType.info.label.toLowerCase(),
        resetButton: IconButton(
          icon: const Icon(Icons.restart_alt),
          onPressed: () {
            setState(() {
              // TODO: reset fractal painter state.
            });
          },
        ),
      ),
    );
  }
}
