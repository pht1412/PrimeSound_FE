import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/music_home_model.dart';

class PrimePicksItem extends StatelessWidget {
  final PlaylistModel playlist;
  final VoidCallback? onTap;

  PrimePicksItem({Key? key, required this.playlist, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.gray_800,
          borderRadius: BorderRadius.circular(26.h),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: appTheme.indigo_A700,
                borderRadius: BorderRadius.circular(20.h),
              ),
              padding: EdgeInsets.all(14.h),
              child: Column(
                children: [
                  SizedBox(height: 104.h),
                  if (playlist.isRecommended ?? false)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: appTheme.green_A700_01,
                          borderRadius: BorderRadius.circular(14.h),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                          vertical: 2.h,
                        ),
                        child: Text(
                          "Recommended",
                          style: TextStyleHelper.instance.body15BoldInter,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.title ?? "",
                    style: TextStyleHelper.instance.title16BoldInter,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    playlist.subtitle ?? "",
                    style: TextStyleHelper.instance.body13BoldInter.copyWith(
                      color: appTheme.gray_400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
