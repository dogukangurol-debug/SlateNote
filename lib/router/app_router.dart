import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/docs/docs_page.dart';
import '../presentation/pages/forms/forms_page.dart';
import '../presentation/pages/notebook_detail/notebook_detail_page.dart';
import '../presentation/pages/notebooks/notebooks_page.dart';
import '../presentation/pages/projects/projects_page.dart';
import '../presentation/pages/settings/settings_page.dart';
import '../presentation/pages/wiki/wiki_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/notebooks',
    routes: [
      GoRoute(
        path: '/notebooks',
        builder: (context, state) => const NotebooksPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return NotebookDetailPage(notebookId: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/docs',
        builder: (context, state) => const DocsPage(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectsPage(),
      ),
      GoRoute(
        path: '/wiki',
        builder: (context, state) => const WikiPage(),
      ),
      GoRoute(
        path: '/forms',
        builder: (context, state) => const FormsPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
});
