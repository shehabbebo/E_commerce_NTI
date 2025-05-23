class OrderModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final String status;
  final DateTime date;
  final int quantity;

  OrderModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.status,
    required this.date,
    required this.quantity,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      status: json['status'] ?? 'Active',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'status': status,
      'date': date.toIso8601String(),
      'quantity': quantity,
    };
  }
}
