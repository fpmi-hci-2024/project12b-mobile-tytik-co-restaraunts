part of 'cafe_bloc.dart';

class CafeState {
  final Cafe cafe;
  final List<MenuPosition> menu;
  final MenuPositionType selectedType;
  final bool dataLoaded;

  const CafeState({
    this.dataLoaded = false,
    this.cafe = const Cafe.empty(),
    this.menu = const <MenuPosition>[],
    this.selectedType = MenuPositionType.food,
  });

  CafeState copyWith({
    Cafe? cafe,
    List<MenuPosition>? menu,
    MenuPositionType? selectedType,
    bool? dataLoaded,
  }) =>
      CafeState(
        cafe: cafe ?? this.cafe,
        menu: menu ?? this.menu,
        selectedType: selectedType ?? this.selectedType,
        dataLoaded: dataLoaded ?? this.dataLoaded,
      );
}
