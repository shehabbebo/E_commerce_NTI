import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/end_point.dart';
import 'package:shop/features/slider/data/model/slider_model.dart';

class SlidersRepo {
  Future<List<SliderModel>> getSliders() async {
    final response = await ApiHelper().getRequest(
      endPoint: EndPoints.getAllSliders,
      isProtected: false,
    );

    if (response.status) {
      return (response.data as List)
          .map((e) => SliderModel.fromJson(e))
          .toList();
    } else {
      throw Exception("فشل تحميل السلايدر");
    }
  }
}
