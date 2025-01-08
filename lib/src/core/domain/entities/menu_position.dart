enum MenuPositionType {
  food,
  drink;

  factory MenuPositionType.fromString(String name) {
    switch (name) {
      case 'food':
        return MenuPositionType.food;
      case 'drink':
        return MenuPositionType.drink;
      default:
        return MenuPositionType.food;
    }
  }
}

extension on MenuPositionType {}

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

  factory MenuPosition.fromJson(Map<String, dynamic> json) {
    return MenuPosition(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      cost: json['cost'],
      ingredients:
          (json['ingredients'] as List?)?.map((e) => e as String).toList(),
      type: MenuPositionType.values[json['type']],
      count: json['count'],
    );
  }
}

extension MenuPositionSerialization on MenuPosition {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'cost': cost,
      'ingredients': ingredients,
      'type': type.index,
      'count': count,
    };
  }
}
