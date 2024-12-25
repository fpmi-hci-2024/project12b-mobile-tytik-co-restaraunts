enum MenuPositionType {
  food,
  drink;
}

class MenuPosition {
  final String name;
  final String imageUrl;
  final List<String>? ingredients;
  final MenuPositionType type;

  const MenuPosition({
    required this.name,
    required this.imageUrl,
    this.ingredients,
    this.type = MenuPositionType.food,
  });
}
