import '../../../core/app_export.dart';

class MusicHomeModel extends Equatable {
  MusicHomeModel({
    this.moodCategories,
    this.recentlyPlayedTracks,
    this.primePicksPlaylists,
    this.trendingTracks,
  }) {
    moodCategories =
        moodCategories ??
        [
          MoodCategoryModel(
            icon: ImageConstant.imgOpenmojiWindFace,
            title: "Chill",
            gradient: "linear-gradient(90deg,#59f678 0%, #00ab22 100%)",
          ),
          MoodCategoryModel(
            icon: ImageConstant.imgMingcuteFitnessFill,
            title: "Workout",
            gradient: "linear-gradient(90deg,#7f00ff33 0%, #008686 100%)",
          ),
          MoodCategoryModel(
            icon: ImageConstant.imgIconParkSolidFocusOne,
            title: "Focus",
            gradient: "linear-gradient(90deg,#c1fff3 0%, #008686 100%)",
          ),
          MoodCategoryModel(
            icon: ImageConstant.imgLineMdMoonFilled,
            title: "Night",
            gradient: "linear-gradient(90deg,#e5252698 0%, #9900035b 100%)",
          ),
        ];

    recentlyPlayedTracks =
        recentlyPlayedTracks ??
        [
          TrackModel(
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
          TrackModel(
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
          TrackModel(
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
        ];

    primePicksPlaylists =
        primePicksPlaylists ??
        [
          PlaylistModel(
            title: "Top hits 2026",
            subtitle: "the biggest song right now",
            isRecommended: true,
          ),
          PlaylistModel(
            title: "Top hits 2026",
            subtitle: "the biggest song right now",
            isRecommended: true,
          ),
        ];

    trendingTracks =
        trendingTracks ??
        [
          TrendingTrackModel(
            ranking: "1",
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
          TrendingTrackModel(
            ranking: "1",
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
          TrendingTrackModel(
            ranking: "1",
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
          TrendingTrackModel(
            ranking: "1",
            title: "One last time",
            artist: "Ariana Grande",
            thumbnail: ImageConstant.imgFrame3,
          ),
        ];
  }

  List<MoodCategoryModel>? moodCategories;
  List<TrackModel>? recentlyPlayedTracks;
  List<PlaylistModel>? primePicksPlaylists;
  List<TrendingTrackModel>? trendingTracks;

  MusicHomeModel copyWith({
    List<MoodCategoryModel>? moodCategories,
    List<TrackModel>? recentlyPlayedTracks,
    List<PlaylistModel>? primePicksPlaylists,
    List<TrendingTrackModel>? trendingTracks,
  }) {
    return MusicHomeModel(
      moodCategories: moodCategories ?? this.moodCategories,
      recentlyPlayedTracks: recentlyPlayedTracks ?? this.recentlyPlayedTracks,
      primePicksPlaylists: primePicksPlaylists ?? this.primePicksPlaylists,
      trendingTracks: trendingTracks ?? this.trendingTracks,
    );
  }

  @override
  List<Object?> get props => [
    moodCategories,
    recentlyPlayedTracks,
    primePicksPlaylists,
    trendingTracks,
  ];
}

class MoodCategoryModel extends Equatable {
  MoodCategoryModel({this.icon, this.title, this.gradient});

  String? icon;
  String? title;
  String? gradient;

  MoodCategoryModel copyWith({String? icon, String? title, String? gradient}) {
    return MoodCategoryModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  List<Object?> get props => [icon, title, gradient];
}

class TrackModel extends Equatable {
  TrackModel({this.title, this.artist, this.thumbnail});

  String? title;
  String? artist;
  String? thumbnail;

  TrackModel copyWith({String? title, String? artist, String? thumbnail}) {
    return TrackModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [title, artist, thumbnail];
}

class PlaylistModel extends Equatable {
  PlaylistModel({this.title, this.subtitle, this.isRecommended});

  String? title;
  String? subtitle;
  bool? isRecommended;

  PlaylistModel copyWith({
    String? title,
    String? subtitle,
    bool? isRecommended,
  }) {
    return PlaylistModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isRecommended: isRecommended ?? this.isRecommended,
    );
  }

  @override
  List<Object?> get props => [title, subtitle, isRecommended];
}

class TrendingTrackModel extends Equatable {
  TrendingTrackModel({this.ranking, this.title, this.artist, this.thumbnail});

  String? ranking;
  String? title;
  String? artist;
  String? thumbnail;

  TrendingTrackModel copyWith({
    String? ranking,
    String? title,
    String? artist,
    String? thumbnail,
  }) {
    return TrendingTrackModel(
      ranking: ranking ?? this.ranking,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [ranking, title, artist, thumbnail];
}
