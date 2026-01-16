class InkStroke {
  InkStroke({required this.points, required this.colorHex, required this.width});

  final List<InkPoint> points;
  final int colorHex;
  final double width;
}

class InkPoint {
  InkPoint({required this.x, required this.y, required this.pressure});

  final double x;
  final double y;
  final double pressure;
}
