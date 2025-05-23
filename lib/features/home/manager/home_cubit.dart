import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/catogry/data/model/catogory_model.dart';
import 'package:shop/features/home/data/model/home_model.dart';
import 'package:shop/features/home/manager/home_state.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/network/end_point.dart';
import 'package:shop/features/slider/data/model/slider_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];

  List<ProductModel> get favoriteProducts =>
      products.where((product) => product.isFavorite).toList();

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    emit(HomeIndexChanged(newIndex));
  }

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      final response = await ApiHelper().getRequest(
        endPoint: EndPoints.getAllProducts,
        isProtected: true,
      );

      if (response.status) {
        products =
            (response.data as List)
                .map((json) => ProductModel.fromJson(json))
                .toList();
        emit(ProductsLoaded(products));
      } else {
        emit(ProductsError("فشل تحميل المنتجات"));
      }
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    try {
      final response = await ApiHelper().getRequest(
        endPoint: EndPoints.getAllCategories,
        isProtected: true,
      );

      if (response.status) {
        categories =
            (response.data as List)
                .map((json) => CategoryModel.fromJson(json))
                .toList();
        emit(CategoriesLoaded(categories));
      } else {
        emit(CategoriesError("فشل تحميل الفئات"));
      }
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  //slider
  Future<void> getSliders() async {
    emit(SliderLoading());
    try {
      final response = await ApiHelper().getRequest(
        endPoint: EndPoints.getAllSliders,
        isProtected: true,
      );

      if (response.status) {
        sliders =
            (response.data as List)
                .map((json) => SliderModel.fromJson(json))
                .toList();
        emit(SliderLoaded(sliders));
      } else {
        emit(SliderError("فشل تحميل السلايدر"));
      }
    } catch (e) {
      emit(SliderError(e.toString()));
    }
  }

  void toggleFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    emit(ProductsLoaded(List.from(products)));
  }
}
