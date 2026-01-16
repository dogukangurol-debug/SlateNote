import '../entities/doc_item.dart';

abstract class DocRepository {
  List<DocItem> fetchDocs();
}
