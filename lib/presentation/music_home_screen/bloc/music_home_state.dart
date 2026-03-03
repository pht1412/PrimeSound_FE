part of 'music_home_bloc.dart';

class MusicHomeState extends Equatable {
  final MusicHomeModel? musicHomeModelObj;
  final int? selectedMoodIndex;
  final int? selectedRecentlyPlayedIndex;
  final int? selectedPrimePicksIndex;
  final int? selectedTrendingIndex;
  final bool? isNotificationPressed;
  final bool? isMessagePressed;
  final bool? isFavorited;

  MusicHomeState({
    this.musicHomeModelObj,
    this.selectedMoodIndex,
    this.selectedRecentlyPlayedIndex,
    this.selectedPrimePicksIndex,
    this.selectedTrendingIndex,
    this.isNotificationPressed,
    this.isMessagePressed,
    this.isFavorited,
  });

  @override
  List<Object?> get props => [
    musicHomeModelObj,
    selectedMoodIndex,
    selectedRecentlyPlayedIndex,
    selectedPrimePicksIndex,
    selectedTrendingIndex,
    isNotificationPressed,
    isMessagePressed,
    isFavorited,
  ];

  MusicHomeState copyWith({
    MusicHomeModel? musicHomeModelObj,
    int? selectedMoodIndex,
    int? selectedRecentlyPlayedIndex,
    int? selectedPrimePicksIndex,
    int? selectedTrendingIndex,
    bool? isNotificationPressed,
    bool? isMessagePressed,
    bool? isFavorited,
  }) {
    return MusicHomeState(
      musicHomeModelObj: musicHomeModelObj ?? this.musicHomeModelObj,
      selectedMoodIndex: selectedMoodIndex ?? this.selectedMoodIndex,
      selectedRecentlyPlayedIndex:
          selectedRecentlyPlayedIndex ?? this.selectedRecentlyPlayedIndex,
      selectedPrimePicksIndex:
          selectedPrimePicksIndex ?? this.selectedPrimePicksIndex,
      selectedTrendingIndex:
          selectedTrendingIndex ?? this.selectedTrendingIndex,
      isNotificationPressed:
          isNotificationPressed ?? this.isNotificationPressed,
      isMessagePressed: isMessagePressed ?? this.isMessagePressed,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }
}
