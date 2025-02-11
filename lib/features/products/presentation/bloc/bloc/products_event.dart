part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class FetchProducts extends ProductsEvent {}

class FetchProductsWithCategory extends ProductsEvent {
  final String params;
  FetchProductsWithCategory({required this.params});
}
