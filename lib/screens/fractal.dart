import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/navigation/fractalize_app_bar.dart';
import 'package:fractalize/painters/mandelbrot.dart';

class FractalScreen extends StatefulWidget {
  const FractalScreen({super.key, required this.fractalType});
  final FractalType fractalType;

  @override
  State<FractalScreen> createState() => _FractalScreenState();
}

class _FractalScreenState extends State<FractalScreen> {
  // Starting zoom parameters
  final double _startingZoomScale = 1.75;
  final Offset _startingZoomOffset = Offset.zero;
  // Maximum zoom parameters
  final double _maxZoomScale = 2.0;
  final Offset _maxZoomOffset = Offset.zero;
  // Dynamic zoom parameters
  late double _scale;
  late Offset _offset;
  late double _interactionScale;

  int _currentIterations = 5; // Minimum iterations value

  bool _hasMaxZoomOut = false;
  bool _isInteracting = false;

  void _handleInteractionStart(ScaleStartDetails details) {
    _interactionScale = _scale;
    setState(() {
      _isInteracting = true;
    });
  }

  void _handleInteractionUpdate(ScaleUpdateDetails details) {
    double interactionScale = _interactionScale / details.scale;
    setState(() {
      // Limit zoom while zooming out
      if (interactionScale >= _maxZoomScale) {
        _hasMaxZoomOut = true;
        _scale = _maxZoomScale;
        _offset = _maxZoomOffset;
        return;
      }
      // Update zoom while zooming in
      if (interactionScale < _maxZoomScale) {
        _hasMaxZoomOut = false;
        _scale = interactionScale;
        _offset += details.focalPointDelta * interactionScale;
        return;
      }
    });
  }

  void _handleInteractionEnd(ScaleEndDetails details) {
    setState(() {
      _isInteracting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize zoom parameters
    _scale = _startingZoomScale;
    _offset = _startingZoomOffset;
  }

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
              _scale = _startingZoomScale;
              _offset = _startingZoomOffset;
              _currentIterations = 5;
            });
          },
        ),
      ),
      body: GestureDetector(
        onScaleStart: _handleInteractionStart,
        onScaleUpdate: _handleInteractionUpdate,
        onScaleEnd: _handleInteractionEnd,
        child: CustomPaint(
          isComplex: true,
          willChange: _isInteracting,
          size: Size.infinite,
          painter: MandelbrotPainter(
            scale: _scale,
            offset: _offset + const Offset(150, 0),
            currentIterations: _currentIterations,
            resolution:
                _isInteracting
                    ? _hasMaxZoomOut
                        ? 1.0
                        : 4.0
                    : 1.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "remove",
            backgroundColor: Colors.indigoAccent,
            // Disable button when iterations count are bellow 5
            onPressed:
                _currentIterations == 5
                    ? null
                    : () {
                      setState(() {
                        _currentIterations = (_currentIterations - 5).clamp(
                          5,
                          1000,
                        );
                      });
                    },
            mini: true,
            child: const Icon(Icons.remove, color: Colors.white),
          ),
          FloatingActionButton(
            heroTag: "counter",
            backgroundColor: Colors.indigoAccent,
            onPressed: null,
            mini: true,
            child: Text(
              _currentIterations.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          FloatingActionButton(
            heroTag: "add",
            backgroundColor: Colors.indigoAccent,
            // Disable button when iterations count are above 1000
            onPressed:
                _currentIterations == 1000
                    ? null
                    : () {
                      setState(() {
                        _currentIterations = (_currentIterations + 5).clamp(
                          5,
                          1000,
                        );
                      });
                    },
            mini: true,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
