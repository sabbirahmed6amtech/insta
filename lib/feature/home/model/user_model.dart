class UserModel {
  final String id;
  final String username;
  final String fullName;
  final String profileImage;
  final String bio;
  final bool isVerified;
  final int followers;
  final int following;
  final int posts;

  UserModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profileImage,
    required this.bio,
    this.isVerified = false,
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
  });
}
