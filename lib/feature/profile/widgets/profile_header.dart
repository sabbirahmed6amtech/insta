import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/profile_model.dart';
import '../../../util/dimensions.dart';
import '../../../util/app_colors.dart';
class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSize16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.gradientPurple,
                      AppColors.gradientOrange,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? AppColors.darkBackground
                        : AppColors.lightSurface,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profile.profileImage),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(
                      count: profile.posts,
                      label: 'Posts',
                    ),
                    _StatItem(
                      count: profile.followers,
                      label: 'Followers',
                    ),
                    _StatItem(
                      count: profile.following,
                      label: 'Following',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.paddingSize12),
          Text(
            profile.fullName,
            style: TextStyle(
              fontSize: Dimensions.fontSize14,
              fontWeight: FontWeight.w600,
              color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          SizedBox(height: Dimensions.paddingSize5),
          Text(
            profile.bio,
            style: TextStyle(
              fontSize: Dimensions.fontSize14,
              color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final int count;
  final String label;

  const _StatItem({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: Dimensions.fontSize18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: Dimensions.fontSize14,
            color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
      ],
    );
  }
}
