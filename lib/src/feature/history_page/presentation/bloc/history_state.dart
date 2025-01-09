part of 'history_bloc.dart';

class HistoryState {
  final List<Order> orders;
  final bool isLoaded;

  const HistoryState({
    this.orders = const [],
    this.isLoaded = false,
  });

  HistoryState copyWith({
    List<Order>? orders,
    bool? isLoaded,
  }) {
    return HistoryState(
      orders: orders ?? this.orders,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
