enum PageTemplate { lined, blank, grid }

class Notebook {
  Notebook({
    required this.id,
    required this.title,
    required this.coverId,
    required this.pageTemplate,
    required this.categories,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String coverId;
  final PageTemplate pageTemplate;
  final List<String> categories;
  final DateTime createdAt;
}
