import 'package:flutter/material.dart';
import '../../util/dimensions.dart';

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
              color: color ?? Theme.of(context).dividerColor,
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
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: thickness ?? 0.5,
              color: color ?? Theme.of(context).dividerColor,
            ),
          ),
        ],
      );
    }
    
    return Divider(
      thickness: thickness ?? 0.5,
      color: color ?? Theme.of(context).dividerColor,
    );
  }
}
