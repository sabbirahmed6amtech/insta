import 'package:flutter/material.dart';
import '../../util/dimensions.dart';
import '../../util/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? height;
  
  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? Dimensions.paddingSize50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.primaryBlue,
              size: Dimensions.iconSize20,
            ),
            SizedBox(width: Dimensions.paddingSize8),
            Text(
              text,
              style: TextStyle(
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.w600,
                color: textColor ?? AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
