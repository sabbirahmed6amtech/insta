import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/app_colors.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _TabItem(
                  icon: Icons.grid_on,
                  isSelected: controller.selectedTabIndex.value == 0,
                  onTap: () => controller.changeTab(0),
                ),
              ),
              Expanded(
                child: _TabItem(
                  icon: Icons.video_library_outlined,
                  isSelected: controller.selectedTabIndex.value == 1,
                  onTap: () => controller.changeTab(1),
                ),
              ),
            ],
          ),
        ));
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isSelected
                  ? (Get.isDarkMode ? AppColors.darkText : AppColors.lightText)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Icon(
          icon,
          color: isSelected
              ? (Get.isDarkMode ? AppColors.darkText : AppColors.lightText)
              : (Get.isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary),
          size: Dimensions.iconSize28,
        ),
      ),
    );
  }
}
