import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/images.dart';

class LogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;
  
  const LogoWidget({
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Get.isDarkMode ? Images.instagramLogoLight : Images.instagramLogoLight,
      height: height ?? 50,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }
}
