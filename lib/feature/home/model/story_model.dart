class StoryModel {
  final String id;
  final String userId;
  final String username;
  final String profileImage;
  final List<String> storyImages;
  final bool isLive;
  final bool isSeen;
  final DateTime createdAt;

  StoryModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.profileImage,
    required this.storyImages,
    this.isLive = false,
    this.isSeen = false,
    required this.createdAt,
  });
}
