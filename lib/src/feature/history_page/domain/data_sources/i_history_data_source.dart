import '../../../../core/domain/entities/order.dart';

abstract interface class IHistoryDataSource {
  Future<List<Order>> getHistory();

  Future<void> addToHistory(Order order);
}
