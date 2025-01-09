part of 'history_bloc.dart';

abstract class HistoryEvent {
  const HistoryEvent();
}

class InitHistoryPage extends HistoryEvent {
  const InitHistoryPage();
}
