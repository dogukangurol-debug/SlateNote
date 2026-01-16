import '../entities/wiki_page.dart';

abstract class WikiRepository {
  List<WikiPage> fetchPages();
}
