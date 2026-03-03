import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomIconButton - A reusable icon button component with customizable background and styling
 * 
 * Features:
 * - Customizable icon path for different SVG/image assets
 * - Configurable background color with default dark theme
 * - Responsive sizing using SizeUtils extensions
 * - Built-in padding and styling consistency
 * - Touch feedback and accessibility support
 * 
 * @param iconPath - Path to the icon asset (SVG, PNG, etc.)
 * @param onPressed - Callback function when button is pressed
 * @param backgroundColor - Background color for the button
 * @param size - Size of the button (width and height)
 * @param padding - Internal padding for the button content
 * @param margin - External margin around the button
 */
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.size,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// Path to the icon asset
  final String? iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color for the button
  final Color? backgroundColor;

  /// Size of the button (width and height)
  final double? size;

  /// Internal padding for the button content
  final EdgeInsetsGeometry? padding;

  /// External margin around the button
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 6.h, left: 10.h),
      child: Container(
        width: size ?? 28.h,
        height: size ?? 28.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFF3D3D3D),
          borderRadius: BorderRadius.circular(4.h),
        ),
        child: IconButton(
          onPressed: onPressed,
          padding: padding ?? EdgeInsets.all(6.h),
          constraints: BoxConstraints(
            minWidth: size ?? 28.h,
            minHeight: size ?? 28.h,
          ),
          icon: CustomImageView(
            imagePath: iconPath ?? ImageConstant.imgMaterialSymbol,
            height: (size ?? 28.h) - 12.h, // Account for padding
            width: (size ?? 28.h) - 12.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
