import 'package:flutter/material.dart';

import '../../../../domain/entities/notebook.dart';

class InkCanvasPlaceholder extends StatelessWidget {
  const InkCanvasPlaceholder({super.key, required this.template});

  final PageTemplate template;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CustomPaint(
        painter: _TemplatePainter(template),
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Ink canvas placeholder'),
          ),
        ),
      ),
    );
  }
}

class _TemplatePainter extends CustomPainter {
  _TemplatePainter(this.template);

  final PageTemplate template;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    switch (template) {
      case PageTemplate.blank:
        return;
      case PageTemplate.lined:
        for (double y = 32; y < size.height; y += 32) {
          canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
        }
        return;
      case PageTemplate.grid:
        for (double x = 24; x < size.width; x += 24) {
          canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
        }
        for (double y = 24; y < size.height; y += 24) {
          canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
        }
        return;
    }
  }

  @override
  bool shouldRepaint(covariant _TemplatePainter oldDelegate) {
    return oldDelegate.template != template;
  }
}
