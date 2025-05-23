import 'package:shop/features/slider/data/model/slider_model.dart';

abstract class SlidersState {}

class SlidersInitial extends SlidersState {}

class SlidersLoading extends SlidersState {}

class SlidersLoaded extends SlidersState {
  final List<SliderModel> sliders;
  SlidersLoaded(this.sliders);
}

class SlidersError extends SlidersState {
  final String message;
  SlidersError(this.message);
}
