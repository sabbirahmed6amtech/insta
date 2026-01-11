import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';
import '../../util/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final double? thickness;
  final Color? color;
  final double? spacing;
  
  const CustomDivider({
    super.key,
    this.text,
    this.thickness,
    this.color,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Row(
        children: [
          Expanded(
            child: Divider(
              thickness: thickness ?? 0.5,
              color: color ?? (Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing ?? Dimensions.paddingSize16,
            ),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: Dimensions.fontSize12,
                color: Get.isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: thickness ?? 0.5,
              color: color ?? (Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder),
            ),
          ),
        ],
      );
    }
    
    return Divider(
      thickness: thickness ?? 0.5,
      color: color ?? (Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder),
    );
  }
}
