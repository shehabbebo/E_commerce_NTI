import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/catogry/data/repo/catogory_repo.dart';
import 'package:shop/features/catogry/manager/catogoty_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;

  CategoryCubit(this.repository) : super(CategoryInitial());

  void fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await repository.getCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
