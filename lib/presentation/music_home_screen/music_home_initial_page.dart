import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/home/custom_app_bar.dart';
import '../../widgets/home/custom_image_view.dart';
import './bloc/music_home_bloc.dart';
import './models/music_home_model.dart';
import './widgets/mood_category_item.dart';
import './widgets/prime_picks_item.dart';
import './widgets/recently_played_item.dart';
import './widgets/trending_track_item.dart';

class MusicHomeInitialPage extends StatelessWidget {
  const MusicHomeInitialPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return MusicHomeInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicHomeBloc, MusicHomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.gray_900_01,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.h),
            child: CustomAppBar(
              greetingText: "Good Afternoon",
              subtitleText: "Welcome to your PrimeSound experience",
              onNotificationTap: () {
                context.read<MusicHomeBloc>().add(NotificationTappedEvent());
              },
              onMessageTap: () {
                context.read<MusicHomeBloc>().add(MessageTappedEvent());
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24.h, left: 10.h, right: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPrimeMoodSection(context, state),
                SizedBox(height: 26.h),
                _buildRecentlyPlayedSection(context, state),
                SizedBox(height: 44.h),
                _buildPrimePicksSection(context, state),
                SizedBox(height: 22.h),
                _buildTrendingNowSection(context, state),
                SizedBox(height: 32.h),
                _buildCurrentPlayingBar(context, state),
                SizedBox(height: 26.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrimeMoodSection(BuildContext context, MusicHomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prime Mood", style: TextStyleHelper.instance.title20BoldInter),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.only(left: 8.h, right: 56.h),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.h,
            childAspectRatio: 104 / 70,
            children: [
              MoodCategoryItem(
                moodCategory:
                    state.musicHomeModelObj?.moodCategories?[0] ??
                    MoodCategoryModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    MoodCategoryTappedEvent(index: 0),
                  );
                },
              ),
              MoodCategoryItem(
                moodCategory:
                    state.musicHomeModelObj?.moodCategories?[1] ??
                    MoodCategoryModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    MoodCategoryTappedEvent(index: 1),
                  );
                },
              ),
              MoodCategoryItem(
                moodCategory:
                    state.musicHomeModelObj?.moodCategories?[2] ??
                    MoodCategoryModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    MoodCategoryTappedEvent(index: 2),
                  );
                },
              ),
              MoodCategoryItem(
                moodCategory:
                    state.musicHomeModelObj?.moodCategories?[3] ??
                    MoodCategoryModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    MoodCategoryTappedEvent(index: 3),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyPlayedSection(
    BuildContext context,
    MusicHomeState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently Played",
          style: TextStyleHelper.instance.title20BoldInter,
        ),
        SizedBox(height: 6.h),
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 14.h),
            itemCount:
                state.musicHomeModelObj?.recentlyPlayedTracks?.length ?? 0,
            itemBuilder: (context, index) {
              return RecentlyPlayedItem(
                track:
                    state.musicHomeModelObj?.recentlyPlayedTracks?[index] ??
                    TrackModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    RecentlyPlayedTappedEvent(index: index),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPrimePicksSection(BuildContext context, MusicHomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prime Picks For You",
          style: TextStyleHelper.instance.title20BoldInter,
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 18.h),
          itemCount: state.musicHomeModelObj?.primePicksPlaylists?.length ?? 0,
          itemBuilder: (context, index) {
            return PrimePicksItem(
              playlist:
                  state.musicHomeModelObj?.primePicksPlaylists?[index] ??
                  PlaylistModel(),
              onTap: () {
                context.read<MusicHomeBloc>().add(
                  PrimePicksTappedEvent(index: index),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildTrendingNowSection(BuildContext context, MusicHomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trending now", style: TextStyleHelper.instance.title20BoldInter),
        SizedBox(height: 22.h),
        Container(
          decoration: BoxDecoration(
            color: appTheme.gray_800,
            borderRadius: BorderRadius.circular(24.h),
          ),
          padding: EdgeInsets.all(24.h),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: state.musicHomeModelObj?.trendingTracks?.length ?? 0,
            itemBuilder: (context, index) {
              return TrendingTrackItem(
                track:
                    state.musicHomeModelObj?.trendingTracks?[index] ??
                    TrendingTrackModel(),
                onTap: () {
                  context.read<MusicHomeBloc>().add(
                    TrendingTrackTappedEvent(index: index),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentPlayingBar(BuildContext context, MusicHomeState state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      decoration: BoxDecoration(
        color: appTheme.gray_800,
        borderRadius: BorderRadius.circular(32.h),
      ),
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Container(
            width: 38.h,
            height: 34.h,
            decoration: BoxDecoration(
              border: Border.all(color: appTheme.color7F1DB9, width: 4.h),
              borderRadius: BorderRadius.circular(18.h),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame3Black900,
                height: 32.h,
                width: 32.h,
              ),
            ),
          ),
          SizedBox(width: 4.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "One last time",
                    style: TextStyleHelper.instance.body12BoldInter,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Ariana Grande",
                    style: TextStyleHelper.instance.body12BoldInter.copyWith(
                      color: appTheme.gray_400_01,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 4.h),
          GestureDetector(
            onTap: () {
              context.read<MusicHomeBloc>().add(FavoriteToggleEvent());
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgIcon,
              height: 20.h,
              width: 26.h,
            ),
          ),
        ],
      ),
    );
  }
}
