import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/notebook_repository_memory.dart';
import '../../../presentation/layout/tablet_scaffold.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../core/utils/date_formatters.dart';

class NotebooksPage extends ConsumerWidget {
  const NotebooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notebooks = ref.watch(notebookRepositoryProvider).fetchNotebooks();

    return TabletScaffold(
      title: 'Notebooks',
      child: notebooks.isEmpty
          ? const EmptyState(
              title: 'No notebooks yet',
              subtitle: 'Create your first notebook to get started.',
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.6,
              ),
              itemCount: notebooks.length,
              itemBuilder: (context, index) {
                final notebook = notebooks[index];
                return InkWell(
                  onTap: () => context.go('/notebooks/${notebook.id}'),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notebook.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: notebook.categories
                                .map(
                                  (category) => Chip(
                                    label: Text(category),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                )
                                .toList(),
                          ),
                          const Spacer(),
                          Text(
                            'Created ${formatDateShort(notebook.createdAt)}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
