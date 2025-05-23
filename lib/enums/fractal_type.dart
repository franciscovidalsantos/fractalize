enum FractalType { mandelbrotSet, sierpinskiTriangle, kochSnowflake }

class FractalTypeInfo {
  final String label;
  final bool isEnabled;

  const FractalTypeInfo(this.label, this.isEnabled);
}

extension FractalTypeExtension on FractalType {
  FractalTypeInfo get info {
    switch (this) {
      case FractalType.mandelbrotSet:
        return FractalTypeInfo("Mandelbrot Set", true);
      case FractalType.sierpinskiTriangle:
        return FractalTypeInfo("Sierpinski Triangle", true);
      case FractalType.kochSnowflake:
        return FractalTypeInfo("Koch Snowflake", false);
    }
  }
}
