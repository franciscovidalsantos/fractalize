import 'package:flutter/material.dart';

abstract class FractalUtilsPainter extends CustomPainter {
  // Helper method to draw the axes
  void drawAxis(
    Canvas canvas,
    Size size,
    double centerX,
    double centerY,
    double offsetX,
    double offsetY,
    double adjustedScale,
  ) {
    final Paint axesPaint =
        Paint()
          ..color = Colors.red
          ..strokeWidth = 1.0;

    // Horizontal axis
    canvas.drawLine(
      Offset(0, centerY + offsetY),
      Offset(size.width, centerY + offsetY),
      axesPaint,
    );
    // Vertical axis
    canvas.drawLine(
      Offset(centerX + offsetX, 0),
      Offset(centerX + offsetX, size.height),
      axesPaint,
    );
  }

  // Helper method to draw the grid
  void drawGrid(
    Canvas canvas,
    Size size,
    double centerX,
    double centerY,
    double offsetX,
    double offsetY,
    double adjustedScale,
  ) {
    final Paint gridPaint =
        Paint()
          ..color = Colors.grey.withValues(alpha: 0.9)
          ..strokeWidth = 0.5;

    // Positive x grid lines
    for (double x = centerX + offsetX; x < size.width; x += adjustedScale) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    // Negative x grid lines
    for (double x = centerX + offsetX; x > 0; x -= adjustedScale) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    // Negative y grid lines
    for (double y = centerY + offsetY; y < size.height; y += adjustedScale) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    // Positive y grid lines
    for (double y = centerY + offsetY; y > 0; y -= adjustedScale) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  // Helper method to draw the coordinates
  void drawCoordinates(
    Canvas canvas,
    Size size,
    double centerX,
    double centerY,
    double offsetX,
    double offsetY,
    double adjustedScale,
  ) {
    final Paint textPaint =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill;
    // Add coordinate labels
    _drawText(
      canvas,
      "(0,0)",
      Offset(centerX + offsetX - 35, centerY + offsetY + 5),
      textPaint,
    );

    // Calculate visible lengths for each axis
    final double xPositiveLength = size.width - (centerX + offsetX) + 5;
    final double xNegativeLength = centerX + offsetX;
    final double yPositiveLength = centerY + offsetY;
    final double yNegativeLength = size.height - (centerY + offsetY) - 5;
    _drawText(
      canvas,
      xPositiveLength > xNegativeLength ? "x" : "-x",
      Offset(
        xPositiveLength > xNegativeLength ? size.width - 20 : 15,
        centerY + offsetY + 5,
      ),
      textPaint,
    );
    _drawText(
      canvas,
      yPositiveLength > yNegativeLength ? " y" : "-y",
      Offset(
        centerX + offsetX + 5,
        yPositiveLength > yNegativeLength ? 10 : size.height - 30,
      ),
      textPaint,
    );
  }

  // Helper method to draw text
  void _drawText(Canvas canvas, String text, Offset position, Paint paint) {
    final textSpan = TextSpan(
      text: text,
      style: TextStyle(color: paint.color, fontSize: 15),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }
}
