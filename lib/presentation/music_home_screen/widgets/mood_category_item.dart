import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/home/custom_image_view.dart';
import '../models/music_home_model.dart';

class MoodCategoryItem extends StatelessWidget {
  final MoodCategoryModel moodCategory;
  final VoidCallback? onTap;

  MoodCategoryItem({Key? key, required this.moodCategory, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.h),
          gradient: _getGradientFromString(moodCategory.gradient ?? ""),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: moodCategory.icon ?? "",
              height: 28.h,
              width: 28.h,
            ),
            SizedBox(height: 12.h),
            Text(
              moodCategory.title ?? "",
              style: TextStyleHelper.instance.body13BoldInter,
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _getGradientFromString(String gradientString) {
    if (gradientString.contains("#59f678")) {
      return LinearGradient(
        colors: [Color(0xFF59F678), Color(0xFF00AB22)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (gradientString.contains("#7f00ff33")) {
      return LinearGradient(
        colors: [Color(0x337F00FF), Color(0xFF008686)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (gradientString.contains("#c1fff3")) {
      return LinearGradient(
        colors: [Color(0xFFC1FFF3), Color(0xFF008686)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (gradientString.contains("#e5252698")) {
      return LinearGradient(
        colors: [Color(0x98E52526), Color(0x5B990003)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    }
    return LinearGradient(
      colors: [Color(0xFF59F678), Color(0xFF00AB22)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}
