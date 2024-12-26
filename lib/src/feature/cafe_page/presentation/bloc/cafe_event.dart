part of 'cafe_bloc.dart';

abstract class CafeEvent {
  const CafeEvent();
}

class InitCafeData extends CafeEvent {
  final Cafe cafe;

  const InitCafeData(this.cafe);
}

class ChangePositionType extends CafeEvent {
  final MenuPositionType type;

  const ChangePositionType(this.type);
}

class ChangeMenuPositionCount extends CafeEvent {
  final String id;
  final int newCount;

  const ChangeMenuPositionCount({
    required this.id,
    required this.newCount,
  });
}
