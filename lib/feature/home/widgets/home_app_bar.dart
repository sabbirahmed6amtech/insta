import 'package:flutter/material.dart';
import '../../../../util/dimensions.dart';
import '../../../../common/widgets/logo_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: const LogoWidget(height: 35),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Theme.of(context).iconTheme.color,
            size: Dimensions.iconSize28,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.send_outlined,
            color: Theme.of(context).iconTheme.color,
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
