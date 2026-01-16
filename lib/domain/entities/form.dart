class FormItem {
  FormItem({
    required this.id,
    required this.title,
    required this.questions,
    required this.responsesCount,
  });

  final String id;
  final String title;
  final List<String> questions;
  final int responsesCount;
}
