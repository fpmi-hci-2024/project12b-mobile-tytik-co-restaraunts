import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/order.dart';
import '../../domain/repositories/i_history_repository.dart';

part 'history_state.dart';

part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final IHistoryRepository _historyRepository;

  HistoryBloc(this._historyRepository) : super(const HistoryState()) {
    on<InitHistoryPage>(_onInitHistoryPage);
  }

  Future<void> _onInitHistoryPage(
    InitHistoryPage event,
    Emitter<HistoryState> emit,
  ) async {
    final orders = await _historyRepository.getHistory();

    emit(
      state.copyWith(
        orders: orders.reversed.toList(),
        isLoaded: true,
      ),
    );
  }
}
