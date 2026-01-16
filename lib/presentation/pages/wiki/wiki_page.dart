import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/wiki_repository_memory.dart';
import '../../../presentation/layout/tablet_scaffold.dart';
import '../../../presentation/widgets/empty_state.dart';

class WikiPage extends ConsumerWidget {
  const WikiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = ref.watch(wikiRepositoryProvider).fetchPages();
    return TabletScaffold(
      title: 'Wiki',
      child: pages.isEmpty
          ? const EmptyState(
              title: 'No wiki pages',
              subtitle: 'Capture quick notes and knowledge here.',
            )
          : ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(page.title),
                    subtitle: Text(page.content),
                    trailing: Wrap(
                      spacing: 6,
                      children: page.tags
                          .map(
                            (tag) => Chip(
                              label: Text(tag),
                              visualDensity: VisualDensity.compact,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
