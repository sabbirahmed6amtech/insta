class ProfileModel {
  final String id;
  final String username;
  final String fullName;
  final String profileImage;
  final String bio;
  final String website;
  final bool isVerified;
  final bool isPrivate;
  final int posts;
  final int followers;
  final int following;

  ProfileModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profileImage,
    required this.bio,
    this.website = '',
    this.isVerified = false,
    this.isPrivate = false,
    this.posts = 0,
    this.followers = 0,
    this.following = 0,
  });
}
