import 'package:shop/features/catogry/data/model/catogory_model.dart';
import 'package:shop/features/home/data/model/home_model.dart';
import 'package:shop/features/slider/data/model/slider_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeIndexChanged extends HomeState {
  final int currentIndex;
  HomeIndexChanged(this.currentIndex);
}

// Products states
class ProductsLoading extends HomeState {}

class ProductsLoaded extends HomeState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

class ProductsError extends HomeState {
  final String message;
  ProductsError(this.message);
}

// Categories states
class CategoriesLoading extends HomeState {}

class CategoriesLoaded extends HomeState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends HomeState {
  final String message;
  CategoriesError(this.message);
}

// Slider states
class SliderLoading extends HomeState {}

class SliderLoaded extends HomeState {
  final List<SliderModel> sliders;
  SliderLoaded(this.sliders);
}

class SliderError extends HomeState {
  final String message;
  SliderError(this.message);
}
