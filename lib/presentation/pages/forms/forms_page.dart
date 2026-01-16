import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/form_repository_memory.dart';
import '../../../presentation/layout/tablet_scaffold.dart';
import '../../../presentation/widgets/empty_state.dart';

class FormsPage extends ConsumerWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forms = ref.watch(formRepositoryProvider).fetchForms();
    return TabletScaffold(
      title: 'Forms',
      child: forms.isEmpty
          ? const EmptyState(
              title: 'No forms',
              subtitle: 'Start collecting responses with a new form.',
            )
          : ListView.builder(
              itemCount: forms.length,
              itemBuilder: (context, index) {
                final form = forms[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(form.title),
                    subtitle: Text('${form.questions.length} questions'),
                    trailing: Text('${form.responsesCount} responses'),
                  ),
                );
              },
            ),
    );
  }
}
