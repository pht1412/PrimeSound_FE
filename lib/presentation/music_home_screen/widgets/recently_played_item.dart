import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/home/custom_image_view.dart';
import '../models/music_home_model.dart';

class RecentlyPlayedItem extends StatelessWidget {
  final TrackModel track;
  final VoidCallback? onTap;

  RecentlyPlayedItem({Key? key, required this.track, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 102.h,
        decoration: BoxDecoration(
          color: appTheme.gray_900,
          borderRadius: BorderRadius.circular(10.h),
        ),
        padding: EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 86.h,
              height: 94.h,
              decoration: BoxDecoration(
                color: appTheme.indigo_A700,
                borderRadius: BorderRadius.circular(16.h),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.h, bottom: 4.h),
                      child: CustomImageView(
                        imagePath: track.thumbnail ?? "",
                        height: 32.h,
                        width: 28.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              track.title ?? "",
              style: TextStyleHelper.instance.body13BoldInter,
            ),
            Text(
              track.artist ?? "",
              style: TextStyleHelper.instance.label8BoldInter,
            ),
          ],
        ),
      ),
    );
  }
}
