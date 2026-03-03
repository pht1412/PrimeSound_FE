part of 'music_home_bloc.dart';

abstract class MusicHomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MusicHomeInitialEvent extends MusicHomeEvent {}

class MoodCategoryTappedEvent extends MusicHomeEvent {
  final int index;

  MoodCategoryTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class RecentlyPlayedTappedEvent extends MusicHomeEvent {
  final int index;

  RecentlyPlayedTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class PrimePicksTappedEvent extends MusicHomeEvent {
  final int index;

  PrimePicksTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class TrendingTrackTappedEvent extends MusicHomeEvent {
  final int index;

  TrendingTrackTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class NotificationTappedEvent extends MusicHomeEvent {}

class MessageTappedEvent extends MusicHomeEvent {}

class FavoriteToggleEvent extends MusicHomeEvent {}
