import 'package:dio/dio.dart';
import 'package:shop/core/network/end_point.dart';

class HomeRepo {
  final Dio dio;

  HomeRepo({required this.dio});

  Future<List<dynamic>> getHomeData() async {
    try {
      final response = await dio.get(EndPoints.getAllProducts);
      return response.data['data'];
    } catch (e) {
      rethrow;
    }
  }
}
