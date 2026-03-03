import '../models/music_home_model.dart';
import '../../../core/app_export.dart';

part 'music_home_event.dart';
part 'music_home_state.dart';

class MusicHomeBloc extends Bloc<MusicHomeEvent, MusicHomeState> {
  MusicHomeBloc(MusicHomeState initialState) : super(initialState) {
    on<MusicHomeInitialEvent>(_onInitialize);
    on<MoodCategoryTappedEvent>(_onMoodCategoryTapped);
    on<RecentlyPlayedTappedEvent>(_onRecentlyPlayedTapped);
    on<PrimePicksTappedEvent>(_onPrimePicksTapped);
    on<TrendingTrackTappedEvent>(_onTrendingTrackTapped);
    on<NotificationTappedEvent>(_onNotificationTapped);
    on<MessageTappedEvent>(_onMessageTapped);
    on<FavoriteToggleEvent>(_onFavoriteToggle);
  }

  _onInitialize(
    MusicHomeInitialEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    emit(state.copyWith(musicHomeModelObj: MusicHomeModel()));
  }

  _onMoodCategoryTapped(
    MoodCategoryTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle mood category selection
    emit(state.copyWith(selectedMoodIndex: event.index));
  }

  _onRecentlyPlayedTapped(
    RecentlyPlayedTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle recently played track selection
    emit(state.copyWith(selectedRecentlyPlayedIndex: event.index));
  }

  _onPrimePicksTapped(
    PrimePicksTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle prime picks playlist selection
    emit(state.copyWith(selectedPrimePicksIndex: event.index));
  }

  _onTrendingTrackTapped(
    TrendingTrackTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle trending track selection
    emit(state.copyWith(selectedTrendingIndex: event.index));
  }

  _onNotificationTapped(
    NotificationTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle notification icon tap
    emit(state.copyWith(isNotificationPressed: true));
  }

  _onMessageTapped(
    MessageTappedEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Handle message icon tap
    emit(state.copyWith(isMessagePressed: true));
  }

  _onFavoriteToggle(
    FavoriteToggleEvent event,
    Emitter<MusicHomeState> emit,
  ) async {
    // Toggle favorite status of current playing song
    emit(state.copyWith(isFavorited: !(state.isFavorited ?? false)));
  }
}
