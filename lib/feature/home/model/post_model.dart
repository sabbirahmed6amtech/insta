class PostModel {
  final String id;
  final String userId;
  final String username;
  final String userProfileImage;
  final bool isVerified;
  final String location;
  final List<String> postImages;
  final String caption;
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isSaved;
  final DateTime createdAt;
  final List<String> likedBy;

  PostModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    this.isVerified = false,
    this.location = '',
    required this.postImages,
    required this.caption,
    this.likes = 0,
    this.comments = 0,
    this.isLiked = false,
    this.isSaved = false,
    required this.createdAt,
    this.likedBy = const [],
  });

  PostModel copyWith({
    bool? isLiked,
    bool? isSaved,
    int? likes,
  }) {
    return PostModel(
      id: id,
      userId: userId,
      username: username,
      userProfileImage: userProfileImage,
      isVerified: isVerified,
      location: location,
      postImages: postImages,
      caption: caption,
      likes: likes ?? this.likes,
      comments: comments,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      createdAt: createdAt,
      likedBy: likedBy,
    );
  }
}
