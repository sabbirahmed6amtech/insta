import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../../../util/dimensions.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lock_outline,
            size: Dimensions.iconSize16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          SizedBox(width: Dimensions.paddingSize5),
          Text(
            controller.profile.value.username,
            style: TextStyle(
              fontSize: Dimensions.fontSize16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: Dimensions.iconSize20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_box_outlined,
            color: Theme.of(context).iconTheme.color,
            size: Dimensions.iconSize28,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
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
