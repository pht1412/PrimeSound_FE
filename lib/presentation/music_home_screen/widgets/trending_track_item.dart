import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/home/custom_icon_button.dart';
import '../models/music_home_model.dart';

class TrendingTrackItem extends StatelessWidget {
  final TrendingTrackModel track;
  final VoidCallback? onTap;

  TrendingTrackItem({Key? key, required this.track, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            track.ranking ?? "",
            style: TextStyleHelper.instance.body15BoldInter.copyWith(
              color: appTheme.black_900,
            ),
          ),
          SizedBox(width: 18.h),
          Container(
            width: 54.h,
            height: 44.h,
            decoration: BoxDecoration(
              color: appTheme.indigo_A700,
              borderRadius: BorderRadius.circular(10.h),
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track.title ?? "",
                  style: TextStyleHelper.instance.label10BoldInter,
                ),
                SizedBox(height: 8.h),
                Text(
                  track.artist ?? "",
                  style: TextStyleHelper.instance.label8BoldInter,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.h),
          CustomIconButton(
            iconPath: ImageConstant.imgMaterialSymbol,
            backgroundColor: appTheme.gray_800,
            size: 28.h,
            padding: EdgeInsets.all(6.h),
            onPressed: () {
              // Handle trending track action
            },
          ),
        ],
      ),
    );
  }
}
