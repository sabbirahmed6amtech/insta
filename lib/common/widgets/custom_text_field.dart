import 'package:flutter/material.dart';
import '../../util/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? borderColor;
  
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: Dimensions.fontSize14,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: Dimensions.fontSize14,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
        ),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize16,
          vertical: Dimensions.paddingSize12,
        ),
        counterText: '',
      ),
    );
  }
}
