import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/HomePage/Data/models/highlight.dart';
import '/HomePage/Data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchHomeHighlights>(_onFetchHighlights);
  }

  Future<void> _onFetchHighlights(
    FetchHomeHighlights event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final highlight = await repository.getHighlights();
      final stats = await repository.getRecentStats();
      emit(HomeLoaded(highlight, stats));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}