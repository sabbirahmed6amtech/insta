import 'package:get/get.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';
import '../../../data/dummy_data.dart';

class HomeController extends GetxController {
  final RxList<StoryModel> stories = <StoryModel>[].obs;
  final RxList<PostModel> posts = <PostModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt currentBottomNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      stories.value = DummyData.stories;
      posts.value = DummyData.posts;
      isLoading.value = false;
    });
  }

  void toggleLike(String postId) {
    final index = posts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      final post = posts[index];
      posts[index] = post.copyWith(
        isLiked: !post.isLiked,
        likes: post.isLiked ? post.likes - 1 : post.likes + 1,
      );
    }
  }

  void toggleSave(String postId) {
    final index = posts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      final post = posts[index];
      posts[index] = post.copyWith(
        isSaved: !post.isSaved,
      );
    }
  }

  void changeBottomNavIndex(int index) {
    currentBottomNavIndex.value = index;
    
    if (index == 4) {
      Get.toNamed('/profile');
    }
  }

  void refreshFeed() {
    loadData();
  }
}
