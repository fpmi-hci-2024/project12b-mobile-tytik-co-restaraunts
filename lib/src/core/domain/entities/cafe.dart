import 'dart:math';

class Cafe {
  final String logoUrl;
  final String name;
  final String id;
  final double? rating;

  const Cafe({
    required this.id,
    required this.name,
    this.rating,
    required this.logoUrl,
  });

  const Cafe.empty()
      : id = '',
        name = '',
        rating = null,
        logoUrl = '';

  factory Cafe.fromJson(Map<String, dynamic> json) {
    int seedHash = json['name'].hashCode;
    seedHash = seedHash.abs();
    final random = Random(seedHash);
    final result = 3 + random.nextDouble() * 2;
    return Cafe(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: result,
      logoUrl: json['logo_url'] as String,
    );
  }
}
