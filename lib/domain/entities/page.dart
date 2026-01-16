import 'notebook.dart';

class Page {
  Page({
    required this.id,
    required this.notebookId,
    required this.pageIndex,
    required this.backgroundTemplate,
    required this.createdAt,
  });

  final String id;
  final String notebookId;
  final int pageIndex;
  final PageTemplate backgroundTemplate;
  final DateTime createdAt;
}
