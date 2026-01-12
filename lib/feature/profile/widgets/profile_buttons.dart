import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import '../../../util/dimensions.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              text: 'Edit Profile',
              onPressed: controller.editProfile,
            ),
          ),
          SizedBox(width: Dimensions.paddingSize8),
          _ActionButton(
            icon: Icons.person_add_outlined,
            onPressed: () {},
            isIconOnly: true,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isIconOnly;

  const _ActionButton({
    this.text,
    this.icon,
    required this.onPressed,
    this.isIconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isIconOnly
                ? Dimensions.paddingSize10
                : Dimensions.paddingSize16,
          ),
        ),
        child: icon != null
            ? Icon(
                icon,
                size: Dimensions.iconSize20,
                color: Theme.of(context).colorScheme.onSurface,
              )
            : Text(
                text ?? '',
                style: TextStyle(
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
      ),
    );
  }
}
