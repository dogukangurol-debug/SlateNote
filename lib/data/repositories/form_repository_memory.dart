import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/form.dart';
import '../../domain/repositories/form_repository.dart';

class InMemoryFormRepository implements FormRepository {
  final List<FormItem> _forms = [
    FormItem(
      id: 'form-1',
      title: 'User Research Intake',
      questions: ['Name', 'Team', 'Research goals'],
      responsesCount: 12,
    ),
    FormItem(
      id: 'form-2',
      title: 'Workshop Feedback',
      questions: ['Rating', 'Highlights', 'Improvements'],
      responsesCount: 7,
    ),
  ];

  @override
  List<FormItem> fetchForms() => List.unmodifiable(_forms);
}

final formRepositoryProvider = Provider<FormRepository>((ref) {
  return InMemoryFormRepository();
});
