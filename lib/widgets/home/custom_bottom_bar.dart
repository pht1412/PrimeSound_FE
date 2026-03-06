import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A reusable bottom navigation bar component
 * 
 * Features:
 * - Icon-based navigation with customizable items
 * - Support for active/inactive states
 * - Configurable background color and shadow
 * - Responsive design with proper spacing
 * 
 * @param bottomBarItemList - List of navigation items to display
 * @param selectedIndex - Currently selected tab index (default: 0)
 * @param onChanged - Callback function when tab is tapped
 * @param backgroundColor - Background color of the bottom bar
 * @param enableShadow - Whether to show shadow effect
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
    this.backgroundColor,
    this.enableShadow = true,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  /// Background color of the bottom bar
  final Color? backgroundColor;

  /// Whether to enable shadow effect
  final bool enableShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFF000000),
        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: appTheme.color888888,
                  blurRadius: 20.h,
                  offset: Offset(0, 4.h),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomBarItemList.length, (index) {
                final item = bottomBarItemList[index];
                final isSelected = selectedIndex == index;

                return InkWell(
                  onTap: () => onChanged(index),
                  child: _buildBottomBarItem(item, isSelected),
                );
              }),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  /// Builds individual bottom bar item
  Widget _buildBottomBarItem(CustomBottomBarItem item, bool isSelected) {
    return CustomImageView(
      imagePath: isSelected ? (item.activeIcon ?? item.icon) : item.icon,
      height: 24.h,
      width: 24.h,
    );
  }
}

/// Item data model for custom bottom bar
class CustomBottomBarItem {
  CustomBottomBarItem({required this.icon, this.activeIcon, this.routeName});

  /// Path to the default/inactive icon
  final String icon;

  /// Path to the active state icon (optional)
  final String? activeIcon;

  /// Route name for navigation
  final String? routeName;
}
