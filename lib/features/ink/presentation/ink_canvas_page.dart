import 'package:flutter/material.dart';

import 'widgets/ink_canvas_placeholder.dart';
import '../../../domain/entities/notebook.dart';

class InkCanvasPage extends StatelessWidget {
  const InkCanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InkCanvasPlaceholder(template: PageTemplate.blank);
  }
}
