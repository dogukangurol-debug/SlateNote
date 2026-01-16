import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/wiki_page.dart';
import '../../domain/repositories/wiki_repository.dart';

class InMemoryWikiRepository implements WikiRepository {
  final List<WikiPage> _pages = [
    WikiPage(
      id: 'wiki-1',
      title: 'Meeting Notes',
      content: 'Quick recap of weekly syncs and action items.',
      tags: ['team', 'sync'],
    ),
    WikiPage(
      id: 'wiki-2',
      title: 'Design System',
      content: 'Tokens, components, and guidelines.',
      tags: ['design', 'system'],
    ),
  ];

  @override
  List<WikiPage> fetchPages() => List.unmodifiable(_pages);
}

final wikiRepositoryProvider = Provider<WikiRepository>((ref) {
  return InMemoryWikiRepository();
});
