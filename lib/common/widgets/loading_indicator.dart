import 'package:flutter/material.dart';
import '../../util/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? strokeWidth;
  
  const LoadingIndicator({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 30,
        height: size ?? 30,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}
