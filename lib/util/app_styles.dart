import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dimensions.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle get headingLarge => TextStyle(
    fontSize: Dimensions.fontSize32,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get headingMedium => TextStyle(
    fontSize: Dimensions.fontSize28,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get headingSmall => TextStyle(
    fontSize: Dimensions.fontSize24,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get titleLarge => TextStyle(
    fontSize: Dimensions.fontSize20,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get titleMedium => TextStyle(
    fontSize: Dimensions.fontSize18,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get titleSmall => TextStyle(
    fontSize: Dimensions.fontSize16,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get bodyLarge => TextStyle(
    fontSize: Dimensions.fontSize16,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get bodyMedium => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
  );
  
  static TextStyle get bodySmall => TextStyle(
    fontSize: Dimensions.fontSize12,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary,
  );
  
  static TextStyle get username => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get caption => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? AppColors.darkText : AppColors.lightText,
  );
  
  static TextStyle get buttonText => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  
  static TextStyle get linkText => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryBlue,
  );
  
  static BoxDecoration get containerDecoration => BoxDecoration(
    color: Get.isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
    borderRadius: BorderRadius.circular(Dimensions.radius12),
    border: Border.all(
      color: Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
      width: 0.5,
    ),
  );
  
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: Get.isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
    borderRadius: BorderRadius.circular(Dimensions.radius8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  static InputDecoration inputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) => InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: Dimensions.fontSize14,
      color: Get.isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Get.isDarkMode ? AppColors.darkSurface : AppColors.lightBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Get.isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: const BorderSide(
        color: AppColors.primaryBlue,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: const BorderSide(
        color: AppColors.errorRed,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: Dimensions.paddingSize16,
      vertical: Dimensions.paddingSize12,
    ),
  );
}
