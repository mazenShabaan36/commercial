part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final dynamic data;
  final String selectedCategory;
  CategoryLoaded(this.data, {this.selectedCategory = 'All'});
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}

class CategorySelected extends CategoryState {
  final String selectedCategory;

  CategorySelected(this.selectedCategory);
}
