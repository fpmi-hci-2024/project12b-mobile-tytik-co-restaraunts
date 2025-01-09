import '../../../../core/domain/entities/order.dart';
import '../../domain/data_sources/i_history_data_source.dart';
import '../../domain/repositories/i_history_repository.dart';

class HistoryRepository implements IHistoryRepository {
  final IHistoryDataSource _historyDataSource;

  HistoryRepository(this._historyDataSource);

  @override
  Future<List<Order>> getHistory() async {
    return await _historyDataSource.getHistory();
  }

  @override
  Future<void> addToHistory(Order order) async {
    return await _historyDataSource.addToHistory(order);
  }
}
