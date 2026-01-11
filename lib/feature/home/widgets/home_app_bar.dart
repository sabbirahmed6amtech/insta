import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/app_colors.dart';
import '../../../../common/widgets/logo_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.isDarkMode ? AppColors.darkBackground : AppColors.lightSurface,
      elevation: 0,
      title: const LogoWidget(height: 35),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Get.isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
            size: Dimensions.iconSize28,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.send_outlined,
            color: Get.isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
            size: Dimensions.iconSize28,
          ),
          onPressed: () {},
        ),
        SizedBox(width: Dimensions.paddingSize8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
