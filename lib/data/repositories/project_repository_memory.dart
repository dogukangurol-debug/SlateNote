import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';

class InMemoryProjectRepository implements ProjectRepository {
  final List<Project> _projects = [
    Project(
      id: 'prj-1',
      title: 'Tablet UX Refresh',
      createdAt: DateTime(2024, 1, 8),
    ),
    Project(
      id: 'prj-2',
      title: 'Research Sprint',
      createdAt: DateTime(2024, 2, 14),
    ),
  ];

  @override
  List<Project> fetchProjects() => List.unmodifiable(_projects);
}

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return InMemoryProjectRepository();
});
