import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/domain/entities/cafe.dart';
import '../../domain/repositories/i_all_cafes_repository.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IAllCafesRepository _allCafesRepository;

  HomeBloc(this._allCafesRepository) : super(const HomeState()) {
    on<InitHomePage>(_onInitHomePage);
    on<QueryChanged>(
      _onQueryChanged,
      transformer: _debounce(
        const Duration(milliseconds: 500),
      ),
    );
  }

  Future<void> _onInitHomePage(
    InitHomePage event,
    Emitter<HomeState> emit,
  ) async {
    final allCafes = await _allCafesRepository.getAllCafes();
    final bestDaily = await _allCafesRepository.getBestDaily();

    emit(
      state.copyWith(
        allCafes: allCafes,
        bestDaily: bestDaily,
        pageLoaded: true,
      ),
    );
  }

  Future<void> _onQueryChanged(
    QueryChanged event,
    Emitter<HomeState> emit,
  ) async {
    bool showSearchResults = false;
    List<Cafe>? results;
    if (event.newQuery.isNotEmpty) {
      showSearchResults = true;
      results = await _allCafesRepository.findCafes(
        event.newQuery,
      );
    }
    emit(
      state.copyWith(
        searchResultCafes: results,
        showSearchResults: showSearchResults,
      ),
    );
  }

  EventTransformer<E> _debounce<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }
}
