import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/notebook.dart';
import '../../domain/entities/page.dart';
import '../../domain/repositories/notebook_repository.dart';

class InMemoryNotebookRepository implements NotebookRepository {
  InMemoryNotebookRepository()
      : _notebooks = [
          Notebook(
            id: 'nb-1',
            title: 'Design Notes',
            coverId: 'cover-1',
            pageTemplate: PageTemplate.lined,
            categories: ['design', 'ux'],
            createdAt: DateTime(2024, 1, 12),
          ),
          Notebook(
            id: 'nb-2',
            title: 'Research',
            coverId: 'cover-2',
            pageTemplate: PageTemplate.grid,
            categories: ['lab', 'ideas'],
            createdAt: DateTime(2024, 2, 2),
          ),
          Notebook(
            id: 'nb-3',
            title: 'Personal Journal',
            coverId: 'cover-3',
            pageTemplate: PageTemplate.blank,
            categories: ['personal'],
            createdAt: DateTime(2024, 3, 21),
          ),
        ],
        _pages = [
          Page(
            id: 'pg-1',
            notebookId: 'nb-1',
            pageIndex: 1,
            backgroundTemplate: PageTemplate.lined,
            createdAt: DateTime(2024, 1, 12),
          ),
          Page(
            id: 'pg-2',
            notebookId: 'nb-1',
            pageIndex: 2,
            backgroundTemplate: PageTemplate.lined,
            createdAt: DateTime(2024, 1, 13),
          ),
          Page(
            id: 'pg-3',
            notebookId: 'nb-2',
            pageIndex: 1,
            backgroundTemplate: PageTemplate.grid,
            createdAt: DateTime(2024, 2, 2),
          ),
          Page(
            id: 'pg-4',
            notebookId: 'nb-2',
            pageIndex: 2,
            backgroundTemplate: PageTemplate.grid,
            createdAt: DateTime(2024, 2, 3),
          ),
          Page(
            id: 'pg-5',
            notebookId: 'nb-3',
            pageIndex: 1,
            backgroundTemplate: PageTemplate.blank,
            createdAt: DateTime(2024, 3, 21),
          ),
        ];

  final List<Notebook> _notebooks;
  final List<Page> _pages;

  @override
  List<Notebook> fetchNotebooks() => List.unmodifiable(_notebooks);

  @override
  Notebook? fetchNotebookById(String id) {
    return _notebooks.where((notebook) => notebook.id == id).firstOrNull;
  }

  @override
  List<Page> fetchPages(String notebookId) {
    return _pages
        .where((page) => page.notebookId == notebookId)
        .toList(growable: false);
  }
}

final notebookRepositoryProvider = Provider<NotebookRepository>((ref) {
  return InMemoryNotebookRepository();
});

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      return null;
    }
    return iterator.current;
  }
}
