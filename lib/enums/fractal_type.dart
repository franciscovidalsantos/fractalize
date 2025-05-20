enum FractalType { mandelbrotSet, sierpinskiTriangle }

extension FractalTypeExtension on FractalType {
  String get label {
    switch (this) {
      case FractalType.mandelbrotSet:
        return "Mandelbrot Set";
      case FractalType.sierpinskiTriangle:
        return "Sierpinski Triangle";
    }
  }
}
