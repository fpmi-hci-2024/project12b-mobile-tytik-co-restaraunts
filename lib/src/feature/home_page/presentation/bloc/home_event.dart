part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class InitHomePage extends HomeEvent {
  const InitHomePage();
}

class QueryChanged extends HomeEvent {
  final String newQuery;

  const QueryChanged(this.newQuery);
}
