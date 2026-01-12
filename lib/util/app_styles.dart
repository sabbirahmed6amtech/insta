import 'package:flutter/material.dart';
import 'dimensions.dart';

class AppStyles {
  static TextStyle headingLarge(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize32,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle headingMedium(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize28,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle headingSmall(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize24,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize18,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle titleSmall(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize16,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize16,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyMedium?.color,
  );
  
  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize12,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodySmall?.color,
  );
  
  static TextStyle username(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).colorScheme.onSurface,
  );
  
  static TextStyle buttonText(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSecondary,
  );
  
  static TextStyle linkText(BuildContext context) => TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).colorScheme.secondary,
  );
  
  static BoxDecoration containerDecoration(BuildContext context) => BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(Dimensions.radius12),
    border: Border.all(
      color: Theme.of(context).colorScheme.outline,
      width: 0.5,
    ),
  );
  
  static BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(Dimensions.radius8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  static InputDecoration inputDecoration(
    BuildContext context, {
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) => InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: Dimensions.fontSize14,
      color: Theme.of(context).textTheme.bodySmall?.color,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Theme.of(context).colorScheme.surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: Dimensions.paddingSize16,
      vertical: Dimensions.paddingSize12,
    ),
  );
}

