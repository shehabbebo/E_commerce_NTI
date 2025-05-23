import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/features/catogry/data/model/catogory_model.dart';

class CategoryRepository {
  final String apiUrl =
      'https://nti-ecommerce-api-production-fcb1.up.railway.app/api/categories';

  Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
