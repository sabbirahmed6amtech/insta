import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';
import '../../util/app_colors.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  
  const ClickableText({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize ?? Dimensions.fontSize14,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppColors.primaryBlue,
        ),
      ),
    );
  }
}

class RichClickableText extends StatelessWidget {
  final String normalText;
  final String clickableText;
  final VoidCallback onTap;
  final double? fontSize;
  final Color? normalColor;
  final Color? clickableColor;
  final FontWeight? normalWeight;
  final FontWeight? clickableWeight;
  final TextAlign? textAlign;
  
  const RichClickableText({
    super.key,
    required this.normalText,
    required this.clickableText,
    required this.onTap,
    this.fontSize,
    this.normalColor,
    this.clickableColor,
    this.normalWeight,
    this.clickableWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize ?? Dimensions.fontSize14,
            color: normalColor ?? (Get.isDarkMode ? AppColors.darkTextTertiary : AppColors.lightTextTertiary),
            fontWeight: normalWeight ?? FontWeight.normal,
          ),
          children: [
            TextSpan(text: normalText),
            TextSpan(
              text: ' $clickableText',
              style: TextStyle(
                color: clickableColor ?? AppColors.primaryBlue,
                fontWeight: clickableWeight ?? FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
