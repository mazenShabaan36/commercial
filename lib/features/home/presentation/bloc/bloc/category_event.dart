part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class FetchCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  final String category;

  SelectCategory(this.category);
}
