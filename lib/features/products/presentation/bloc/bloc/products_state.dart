part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final dynamic productsList;
  ProductsLoaded({required this.productsList});
}

final class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure({required this.message});
}
