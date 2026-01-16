import '../entities/notebook.dart';
import '../entities/page.dart';

abstract class NotebookRepository {
  List<Notebook> fetchNotebooks();
  Notebook? fetchNotebookById(String id);
  List<Page> fetchPages(String notebookId);
}
