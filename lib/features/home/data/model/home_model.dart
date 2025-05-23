class ProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}
