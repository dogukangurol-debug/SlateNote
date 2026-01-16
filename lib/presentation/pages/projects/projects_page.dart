import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/project_repository_memory.dart';
import '../../../presentation/layout/tablet_scaffold.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../core/utils/date_formatters.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectRepositoryProvider).fetchProjects();
    return TabletScaffold(
      title: 'Projects',
      child: projects.isEmpty
          ? const EmptyState(
              title: 'No projects',
              subtitle: 'Create a project to group notebooks and docs.',
            )
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(project.title),
                    subtitle: Text('Created ${formatDateShort(project.createdAt)}'),
                  ),
                );
              },
            ),
    );
  }
}
