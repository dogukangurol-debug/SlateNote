import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/doc_item.dart';
import '../../domain/repositories/doc_repository.dart';

class InMemoryDocRepository implements DocRepository {
  final List<DocItem> _docs = [
    DocItem(
      id: 'doc-1',
      type: DocType.pdf,
      path: '/storage/docs/design_system.pdf',
      createdAt: DateTime(2024, 2, 10),
    ),
    DocItem(
      id: 'doc-2',
      type: DocType.docx,
      path: '/storage/docs/project_brief.docx',
      createdAt: DateTime(2024, 2, 18),
    ),
    DocItem(
      id: 'doc-3',
      type: DocType.image,
      path: '/storage/docs/inspiration.png',
      createdAt: DateTime(2024, 3, 1),
    ),
  ];

  @override
  List<DocItem> fetchDocs() => List.unmodifiable(_docs);
}

final docRepositoryProvider = Provider<DocRepository>((ref) {
  return InMemoryDocRepository();
});
