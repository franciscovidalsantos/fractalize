import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fractalize/painters/fractal_utils.dart';

class SierpinskiPainter extends FractalUtilsPainter {
  final double scale;
  final Offset offset;
  final int currentIterations;
  final double resolution;
  final bool showAxes;
  final bool showGrid;
  final bool showCoordinates;

  SierpinskiPainter({
    required this.scale,
    required this.offset,
    required this.currentIterations,
    this.resolution = 1.0,
    this.showAxes = false,
    this.showGrid = false,
    this.showCoordinates = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.indigoAccent;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double offsetX = offset.dx / scale;
    final double offsetY = offset.dy / scale;

    final double adjustedScale = 200.0 / scale;

    // Triangle dimensions
    final double triangleSide = 1;
    final double triangleHeight = sqrt(3) / 2 * triangleSide;

    // Scaled triangle dimensions
    final double scaledTriangleSide = triangleSide * adjustedScale;
    final double scaledTriangleHeight = triangleHeight * adjustedScale;

    // Triangle points in screen space
    final Offset top = Offset(
      centerX + offsetX,
      centerY + offsetY - scaledTriangleHeight,
    );
    final Offset left = Offset(
      centerX + offsetX - scaledTriangleSide,
      centerY + offsetY + scaledTriangleHeight,
    );
    final Offset right = Offset(
      centerX + offsetX + scaledTriangleSide,
      centerY + offsetY + scaledTriangleHeight,
    );

    // TODO: This is a workaround to match the iterations with the Sierpinski
    // triangle's structure remove line bellow when we match an interface
    // button for iterations that's able to differ the fractal type
    // is also subtracting 1 since the starting state is 0
    final int adaptedCurrentIterations = (currentIterations / 5).toInt() - 1;

    _drawSierpinskiTriangle(
      canvas,
      paint,
      top,
      left,
      right,
      adaptedCurrentIterations,
    );

    // Draw selected helpers at the end to avoid overlapping
    if (showAxes) {
      drawAxis(canvas, size, centerX, centerY, offsetX, offsetY, adjustedScale);
    }
    if (showGrid) {
      drawGrid(canvas, size, centerX, centerY, offsetX, offsetY, adjustedScale);
    }
    if (showCoordinates) {
      drawCoordinates(
        canvas,
        size,
        centerX,
        centerY,
        offsetX,
        offsetY,
        adjustedScale,
      );
    }
  }

  void _drawSierpinskiTriangle(
    Canvas canvas,
    Paint paint,
    Offset top,
    Offset left,
    Offset right,
    int iterations,
  ) {
    if (iterations == 0) {
      final Path path =
          Path()
            ..moveTo(top.dx, top.dy)
            ..lineTo(left.dx, left.dy)
            ..lineTo(right.dx, right.dy)
            ..close();
      canvas.drawPath(path, paint);
      return;
    }

    // Midpoints of sides
    final Offset leftMid = Offset(
      (top.dx + left.dx) / 2,
      (top.dy + left.dy) / 2,
    );
    final Offset rightMid = Offset(
      (top.dx + right.dx) / 2,
      (top.dy + right.dy) / 2,
    );
    final Offset bottomMid = Offset(
      (left.dx + right.dx) / 2,
      (left.dy + right.dy) / 2,
    );

    _drawSierpinskiTriangle(
      canvas,
      paint,
      top,
      leftMid,
      rightMid,
      iterations - 1,
    );
    _drawSierpinskiTriangle(
      canvas,
      paint,
      leftMid,
      left,
      bottomMid,
      iterations - 1,
    );
    _drawSierpinskiTriangle(
      canvas,
      paint,
      rightMid,
      bottomMid,
      right,
      iterations - 1,
    );
  }

  @override
  bool shouldRepaint(covariant SierpinskiPainter oldDelegate) {
    return oldDelegate.scale != scale ||
        oldDelegate.offset != offset ||
        oldDelegate.currentIterations != currentIterations ||
        oldDelegate.resolution != resolution ||
        oldDelegate.showAxes != showAxes ||
        oldDelegate.showGrid != showGrid ||
        oldDelegate.showCoordinates != showCoordinates;
  }
}
