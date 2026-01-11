class HighlightModel {
  final String id;
  final String title;
  final String coverImage;
  final List<String> stories;

  HighlightModel({
    required this.id,
    required this.title,
    required this.coverImage,
    this.stories = const [],
  });
}
