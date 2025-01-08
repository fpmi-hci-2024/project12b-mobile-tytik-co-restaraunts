enum MenuPositionType {
  food,
  drink;
}

class MenuPosition {
  final String id;
  final String name;
  final String imageUrl;
  final double cost;
  final List<String>? ingredients;
  final MenuPositionType type;

  //for app
  final int count;

  const MenuPosition({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    this.ingredients,
    this.count = 0,
    this.type = MenuPositionType.food,
  });

  MenuPosition copyWith({
    String? name,
    String? imageUrl,
    double? cost,
    List<String>? ingredients,
    MenuPositionType? type,
    int? count,
  }) {
    return MenuPosition(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      cost: cost ?? this.cost,
      ingredients: ingredients ?? this.ingredients,
      type: type ?? this.type,
      count: count ?? this.count,
    );
  }
}
