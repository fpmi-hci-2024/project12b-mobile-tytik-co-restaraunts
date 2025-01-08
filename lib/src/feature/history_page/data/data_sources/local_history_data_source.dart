import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/domain/entities/order.dart';
import '../../domain/data_sources/i_history_data_source.dart';

class LocalHistoryDataSource implements IHistoryDataSource {
  static const String historyKey = "order_history";

  @override
  Future<void> addToHistory(Order order) async {
    final prefs = await SharedPreferences.getInstance();

    final historyString = prefs.getString(historyKey);
    final List<Order> history = historyString == null
        ? []
        : (jsonDecode(historyString) as List)
        .map((e) => Order.fromJson(e))
        .toList();

    history.add(order);

    final updatedHistoryString = jsonEncode(history.map((e) => e.toJson()).toList());
    await prefs.setString(historyKey, updatedHistoryString);
  }

  @override
  Future<List<Order>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final historyString = prefs.getString(historyKey);
    if (historyString == null) {
      return [];
    }

    final List<Order> history = (jsonDecode(historyString) as List)
        .map((e) => Order.fromJson(e))
        .toList();

    return history;
  }
}