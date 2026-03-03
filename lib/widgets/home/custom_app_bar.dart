import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomAppBar is a reusable AppBar component that displays a user profile section
 * with greeting text and action icons for notifications and messages.
 * 
 * @param profileImage - Optional profile image path
 * @param profileBackgroundColor - Background color for profile avatar when no image
 * @param greetingText - Main greeting text (e.g., "Good Afternoon")
 * @param subtitleText - Subtitle message text
 * @param showNotificationIcon - Whether to show notification bell icon
 * @param showMessageIcon - Whether to show message icon
 * @param onNotificationTap - Callback for notification icon tap
 * @param onMessageTap - Callback for message icon tap
 * @param backgroundColor - AppBar background color
 * @param height - Custom AppBar height
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.profileImage,
    this.profileBackgroundColor,
    this.greetingText,
    this.subtitleText,
    this.showNotificationIcon,
    this.showMessageIcon,
    this.onNotificationTap,
    this.onMessageTap,
    this.backgroundColor,
    this.height,
  }) : super(key: key);

  /// Optional profile image path for the avatar
  final String? profileImage;

  /// Background color for profile avatar when no image is provided
  final Color? profileBackgroundColor;

  /// Main greeting text displayed in the AppBar
  final String? greetingText;

  /// Subtitle text displayed below the greeting
  final String? subtitleText;

  /// Whether to show the notification bell icon
  final bool? showNotificationIcon;

  /// Whether to show the message icon
  final bool? showMessageIcon;

  /// Callback function triggered when notification icon is tapped
  final VoidCallback? onNotificationTap;

  /// Callback function triggered when message icon is tapped
  final VoidCallback? onMessageTap;

  /// Background color of the AppBar
  final Color? backgroundColor;

  /// Custom height for the AppBar
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 56.h,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            // Profile Avatar Section
            _buildProfileAvatar(),
            SizedBox(width: 14.h),

            // Text Content Section
            Expanded(child: _buildTextContent()),

            // Action Icons Section
            _buildActionIcons(),
          ],
        ),
      ),
    );
  }

  /// Builds the profile avatar widget
  Widget _buildProfileAvatar() {
    return Container(
      width: 40.h,
      height: 40.h,
      decoration: BoxDecoration(
        color: profileImage != null
            ? null
            : (profileBackgroundColor ?? Color(0xFF008000)),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: profileImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20.h),
              child: CustomImageView(
                imagePath: profileImage!,
                width: 40.h,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            )
          : null,
    );
  }

  /// Builds the text content section with greeting and subtitle
  Widget _buildTextContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greetingText ?? "Good Afternoon",
          style: TextStyleHelper.instance.title20BoldInter.copyWith(
            height: 1.25,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          subtitleText ?? "Welcome to your PrimeSound experience",
          style: TextStyleHelper.instance.body12BoldInter.copyWith(
            color: appTheme.gray_600,
            height: 1.25,
          ),
        ),
      ],
    );
  }

  /// Builds the action icons section
  Widget _buildActionIcons() {
    return Row(
      children: [
        if (showNotificationIcon ?? true) ...[
          InkWell(
            onTap: onNotificationTap,
            borderRadius: BorderRadius.circular(14.h),
            child: Padding(
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMdiBellOutline,
                width: 28.h,
                height: 28.h,
              ),
            ),
          ),
        ],
        if (showMessageIcon ?? true) ...[
          SizedBox(width: 4.h),
          InkWell(
            onTap: onMessageTap,
            borderRadius: BorderRadius.circular(14.h),
            child: Padding(
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgLetsIconsMessage,
                width: 28.h,
                height: 28.h,
              ),
            ),
          ),
          SizedBox(width: 6.h),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56.h);
}
