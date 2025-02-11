import 'package:bloc/bloc.dart';
import 'package:commercial/core/usecases/usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryData getCategorydata;
  CategoryBloc({required this.getCategorydata}) : super(CategoryInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await getCategorydata(NoParams());
      result.fold(
        (failure) => emit(CategoryError(failure.message)),
        (data) => emit(CategoryLoaded(data)),
      );
    });

    on<SelectCategory>((event, emit) {
      if (state is CategoryLoaded) {
        final currentState = state as CategoryLoaded;
        emit(CategoryLoaded(currentState.data,
            selectedCategory: event.category));
      }
    });
  }
}
