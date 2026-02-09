class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String imageUrl;
  final String category;
  final String unit;
  final bool inStock;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountedPrice,
    required this.imageUrl,
    required this.category,
    required this.unit,
    this.inStock = true,
    this.rating = 4.0,
    this.reviewCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountedPrice: json['discountedPrice'].toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      unit: json['unit'],
      inStock: json['inStock'] ?? true,
      rating: json['rating']?.toDouble() ?? 4.0,
      reviewCount: json['reviewCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountedPrice': discountedPrice,
      'imageUrl': imageUrl,
      'category': category,
      'unit': unit,
      'inStock': inStock,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}