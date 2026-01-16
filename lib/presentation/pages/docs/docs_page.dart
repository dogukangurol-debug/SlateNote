import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/doc_repository_memory.dart';
import '../../../presentation/layout/tablet_scaffold.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../core/utils/date_formatters.dart';

class DocsPage extends ConsumerWidget {
  const DocsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docs = ref.watch(docRepositoryProvider).fetchDocs();
    return TabletScaffold(
      title: 'Docs',
      child: docs.isEmpty
          ? const EmptyState(
              title: 'No documents',
              subtitle: 'Import documents to see them here.',
            )
          : ListView.separated(
              itemCount: docs.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final doc = docs[index];
                return ListTile(
                  leading: const Icon(Icons.insert_drive_file),
                  title: Text(doc.path.split('/').last),
                  subtitle: Text('Added ${formatDateShort(doc.createdAt)}'),
                  trailing: Text(doc.type.name.toUpperCase()),
                );
              },
            ),
    );
  }
}
