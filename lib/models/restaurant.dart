class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String cuisine;
  final String priceRange;
  final String location;
  final List<String> tags;
  final int deliveryTime;
  final double deliveryFee;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.cuisine,
    required this.priceRange,
    required this.location,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryFee,
  });
}

