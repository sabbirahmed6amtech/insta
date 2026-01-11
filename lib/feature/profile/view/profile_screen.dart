import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/highlights_section.dart';
import '../widgets/profile_tab_bar.dart';
import '../widgets/posts_grid.dart';
import '../../../util/dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(profile: controller.profile.value),
            const ProfileButtons(),
            SizedBox(height: Dimensions.paddingSize16),
            HighlightsSection(highlights: controller.highlights),
            SizedBox(height: Dimensions.paddingSize8),
            const ProfileTabBar(),
            PostsGrid(posts: controller.userPosts),
          ],
        ),
      ),
    );
  }
}
