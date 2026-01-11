import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/app_colors.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return AppBar(
      backgroundColor: Get.isDarkMode ? AppColors.darkBackground : AppColors.lightSurface,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lock_outline,
            size: Dimensions.iconSize16,
            color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
          SizedBox(width: Dimensions.paddingSize5),
          Text(
            controller.profile.value.username,
            style: TextStyle(
              fontSize: Dimensions.fontSize16,
              fontWeight: FontWeight.w600,
              color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: Dimensions.iconSize20,
            color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_box_outlined,
            color: Get.isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
            size: Dimensions.iconSize28,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Get.isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
            size: Dimensions.iconSize28,
          ),
          onPressed: controller.showMenu,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
