import 'package:flutter_bloc/flutter_bloc.dart';

part 'music_upload_event.dart';
part 'music_upload_state.dart';

class MusicUploadBloc extends Bloc<MusicUploadEvent, MusicUploadState> {
  MusicUploadBloc() : super(MusicUploadInitial()) {
    on<SelectMusicFilePressed>((event, emit) {
      // TODO: Implement file picking and state emission
      emit(MusicUploadLoading());
    });
  }
}