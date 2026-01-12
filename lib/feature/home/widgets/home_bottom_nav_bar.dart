import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../../../util/dimensions.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: Dimensions.bottomNavBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(
                  icon: Icons.home,
                  isActive: controller.currentBottomNavIndex.value == 0,
                  onTap: () => controller.changeBottomNavIndex(0),
                ),
                _NavBarItem(
                  icon: Icons.search,
                  isActive: controller.currentBottomNavIndex.value == 1,
                  onTap: () => controller.changeBottomNavIndex(1),
                ),
                _NavBarItem(
                  icon: Icons.add_box_outlined,
                  isActive: controller.currentBottomNavIndex.value == 2,
                  onTap: () => controller.changeBottomNavIndex(2),
                ),
                _NavBarItem(
                  icon: Icons.video_library_outlined,
                  isActive: controller.currentBottomNavIndex.value == 3,
                  onTap: () => controller.changeBottomNavIndex(3),
                ),
                _ProfileNavItem(
                  isActive: controller.currentBottomNavIndex.value == 4,
                  onTap: () => controller.changeBottomNavIndex(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize16,
          vertical: Dimensions.paddingSize8,
        ),
        child: Icon(
          isActive && icon == Icons.home ? Icons.home : icon,
          color: Theme.of(context).iconTheme.color,
          size: Dimensions.iconSize28,
        ),
      ),
    );
  }
}

class _ProfileNavItem extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const _ProfileNavItem({required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize16,
          vertical: Dimensions.paddingSize8,
        ),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.outline,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?img=68',
            ),
          ),
        ),
      ),
    );
  }
}
