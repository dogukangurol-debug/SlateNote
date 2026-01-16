import '../entities/project.dart';

abstract class ProjectRepository {
  List<Project> fetchProjects();
}
