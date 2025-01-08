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
    return Cafe(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: 5.0,
      logoUrl: json['logo_url'] as String,
    );
  }
}
