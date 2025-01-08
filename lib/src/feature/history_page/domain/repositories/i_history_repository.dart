import '../../../../core/domain/entities/order.dart';

abstract interface class IHistoryRepository {
  Future<List<Order>> getHistory();

  Future<void> addToHistory(Order order);
}
