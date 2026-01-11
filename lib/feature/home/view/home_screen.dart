import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/stories_section.dart';
import '../widgets/post_card.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../../../common/widgets/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: const HomeAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingIndicator();
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.refreshFeed();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: StoriesSection(stories: controller.stories),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostCard(post: controller.posts[index]);
                  },
                  childCount: controller.posts.length,
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
