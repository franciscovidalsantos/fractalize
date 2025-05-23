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
    final Paint paint = Paint();

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double offsetX = offset.dx / scale;
    final double offsetY = offset.dy / scale;

    final double adjustedScale = 200.0 / scale;

    final double step = resolution;

    // TODO: This is a workaround to match the iterations with the Sierpinski triangle's structure
    final int adaptedcurrentIterations = (currentIterations / 5).toInt();

    // Draw the Sierpinski triangle
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        double fx = (x - centerX - offsetX) / adjustedScale;
        double fy = (y - centerY - offsetY) / adjustedScale;

        // Rotate by -45 degrees with -pi/4
        final double angle = -pi / 4;
        final double cosTheta = cos(angle);
        final double sinTheta = sin(angle);
        double posRotateX = fx * cosTheta - fy * sinTheta;
        double posRotateY = fx * sinTheta + fy * cosTheta;

        if (_isSierpinskiPixel(
          Offset(posRotateX, posRotateY),
          adaptedcurrentIterations,
        )) {
          paint.color = Colors.black;
          canvas.drawRect(Rect.fromLTWH(x, y, step, step), paint);
        } else {
          paint.color =
              Color.lerp(
                Colors.white,
                Colors.black,
                sqrt(pow(x - centerX, 2) + pow(y - centerY, 2)) /
                    (sqrt(pow(size.width, 2) + pow(size.height, 2))),
              )!;

          canvas.drawRect(Rect.fromLTWH(x, y, step, step), paint);
        }
      }
    }

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

  bool _isSierpinskiPixel(Offset p, int iterations) {
    double x = p.dx;
    double y = p.dy / sqrt(3);

    for (int i = 0; i < iterations; i++) {
      if (x % 0.5 >= 0.25 && y % (1 / 2 / sqrt(3)) >= (1 / 4 / sqrt(3))) {
        return true;
      }
      x *= 2;
      y *= 2;
    }
    return false;
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
