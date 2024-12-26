import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/cafe.dart';
import '../../domain/repositories/i_all_cafes_repository.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IAllCafesRepository _allCafesRepository;

  HomeBloc(this._allCafesRepository) : super(const HomeState()) {
    on<InitHomePage>(_onInitHomePage);
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
}
