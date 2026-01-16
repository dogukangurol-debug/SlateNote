class WikiPage {
  WikiPage({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
  });

  final String id;
  final String title;
  final String content;
  final List<String> tags;
}
