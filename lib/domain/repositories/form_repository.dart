import '../entities/form.dart';

abstract class FormRepository {
  List<FormItem> fetchForms();
}
