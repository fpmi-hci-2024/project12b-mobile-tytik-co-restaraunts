enum MenuPositionType {
  food,
  drink;
}

class MenuPosition {
  final String name;
  final String imageUrl;
  final double cost;
  final List<String>? ingredients;
  final MenuPositionType type;
  final int count;

  const MenuPosition({
    required this.name,
    required this.imageUrl,
    required this.cost,
    this.ingredients,
    this.count = 0,
    this.type = MenuPositionType.food,
  });
}
