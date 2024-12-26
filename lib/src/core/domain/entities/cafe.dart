class Cafe {
  final String? logoUrl;
  final String name;
  final String id;
  final double? rating;

  const Cafe({
    required this.id,
    required this.name,
    this.rating,
    this.logoUrl,
  });

  const Cafe.empty()
      : id = '',
        name = '',
        rating = null,
        logoUrl = null;
}
