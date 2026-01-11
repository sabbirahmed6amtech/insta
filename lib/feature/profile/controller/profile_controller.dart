import 'package:get/get.dart';
import '../model/profile_model.dart';
import '../model/highlight_model.dart';

class ProfileController extends GetxController {
  final Rx<ProfileModel> profile = ProfileModel(
    id: '1',
    username: 'jacob_w',
    fullName: 'Jacob West',
    profileImage: 'https://i.pravatar.cc/150?img=68',
    bio: 'Digital goodies designer @pixsellz\nEverything is designed.',
    website: '',
    isVerified: false,
    isPrivate: false,
    posts: 54,
    followers: 834,
    following: 162,
  ).obs;

  final RxList<HighlightModel> highlights = <HighlightModel>[
    HighlightModel(
      id: 'h1',
      title: 'New',
      coverImage: '',
    ),
    HighlightModel(
      id: 'h2',
      title: 'Friends',
      coverImage: 'https://i.pravatar.cc/150?img=33',
    ),
    HighlightModel(
      id: 'h3',
      title: 'Sport',
      coverImage: 'https://i.pravatar.cc/150?img=14',
    ),
    HighlightModel(
      id: 'h4',
      title: 'Design',
      coverImage: 'https://i.pravatar.cc/150?img=52',
    ),
  ].obs;

  final RxList<String> userPosts = <String>[
    'https://picsum.photos/400/400?random=1',
    'https://picsum.photos/400/400?random=2',
    'https://picsum.photos/400/400?random=3',
    'https://picsum.photos/400/400?random=4',
    'https://picsum.photos/400/400?random=5',
    'https://picsum.photos/400/400?random=6',
    'https://picsum.photos/400/400?random=7',
    'https://picsum.photos/400/400?random=8',
    'https://picsum.photos/400/400?random=9',
    'https://picsum.photos/400/400?random=10',
    'https://picsum.photos/400/400?random=11',
    'https://picsum.photos/400/400?random=12',
  ].obs;

  final RxInt selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void editProfile() {
    Get.snackbar(
      'Info',
      'Edit profile feature coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void shareProfile() {
    Get.snackbar(
      'Info',
      'Share profile feature coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void showMenu() {
    Get.snackbar(
      'Info',
      'Menu feature coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
