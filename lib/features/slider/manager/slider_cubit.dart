import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/slider/data/repo/slider_repo.dart';
import 'package:shop/features/slider/manager/slider_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  final SlidersRepo slidersRepo;
  int currentIndex = 0;

  SlidersCubit(this.slidersRepo) : super(SlidersInitial());

  Future<void> getSliders() async {
    emit(SlidersLoading());
    try {
      final sliders = await slidersRepo.getSliders();
      emit(SlidersLoaded(sliders));
    } catch (e) {
      emit(SlidersError(e.toString()));
    }
  }

  void changeIndex(int index) {
    currentIndex = index;
    if (state is SlidersLoaded) {
      emit(SlidersLoaded((state as SlidersLoaded).sliders));
    }
  }
}
