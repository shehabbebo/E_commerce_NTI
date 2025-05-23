class CategoryModel {
  final String name;
  final String icon;

  CategoryModel({required this.name, required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], icon: json['icon']);
  }
}
