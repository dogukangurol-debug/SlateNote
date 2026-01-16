import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/notebook_repository_memory.dart';
import '../../../domain/entities/page.dart';
import '../../../features/ink/presentation/widgets/ink_canvas_placeholder.dart';
import '../../layout/tablet_scaffold.dart';
import '../../widgets/empty_state.dart';

class NotebookDetailPage extends ConsumerStatefulWidget {
  const NotebookDetailPage({super.key, required this.notebookId});

  final String notebookId;

  @override
  ConsumerState<NotebookDetailPage> createState() => _NotebookDetailPageState();
}

class _NotebookDetailPageState extends ConsumerState<NotebookDetailPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final repo = ref.watch(notebookRepositoryProvider);
    final notebook = repo.fetchNotebookById(widget.notebookId);
    final pages = repo.fetchPages(widget.notebookId);

    if (notebook == null) {
      return const TabletScaffold(
        title: 'Notebook',
        child: EmptyState(
          title: 'Notebook not found',
          subtitle: 'Return to the notebooks list.',
        ),
      );
    }

    final currentPage = pages.isEmpty ? null : pages[_currentIndex.clamp(0, pages.length - 1)];

    return TabletScaffold(
      title: notebook.title,
      toolsPanel: _NotebookToolsPanel(notebookTitle: notebook.title),
      child: Column(
        children: [
          _PageControls(
            page: currentPage,
            totalPages: pages.length,
            onPrev: _currentIndex > 0
                ? () => setState(() => _currentIndex = _currentIndex - 1)
                : null,
            onNext: _currentIndex < pages.length - 1
                ? () => setState(() => _currentIndex = _currentIndex + 1)
                : null,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: InkCanvasPlaceholder(
              template: currentPage?.backgroundTemplate ?? notebook.pageTemplate,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageControls extends StatelessWidget {
  const _PageControls({
    required this.page,
    required this.totalPages,
    this.onPrev,
    this.onNext,
  });

  final Page? page;
  final int totalPages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          page == null ? 'No pages' : 'Page ${page!.pageIndex} of $totalPages',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        IconButton(
          onPressed: onPrev,
          icon: const Icon(Icons.chevron_left),
        ),
        IconButton(
          onPressed: onNext,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class _NotebookToolsPanel extends StatelessWidget {
  const _NotebookToolsPanel({required this.notebookTitle});

  final String notebookTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Text('Notebook: $notebookTitle'),
          const SizedBox(height: 12),
          const Text('Pen presets'),
          const SizedBox(height: 8),
          const Text('Highlighter presets'),
          const SizedBox(height: 8),
          const Text('Eraser settings'),
        ],
      ),
    );
  }
}
