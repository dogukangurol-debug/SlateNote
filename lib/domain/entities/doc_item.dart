enum DocType { pdf, docx, image }

class DocItem {
  DocItem({
    required this.id,
    required this.type,
    required this.path,
    required this.createdAt,
  });

  final String id;
  final DocType type;
  final String path;
  final DateTime createdAt;
}
