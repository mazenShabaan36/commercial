part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<Products> cartProducts;
  CartLoaded({required this.cartProducts});
  double get subTotal =>
      cartProducts.fold(0, (sum, item) => sum + (item.price! * item.quantity));

  double get shipping => cartProducts.isEmpty ? 0.0 : 5.00;

  double get total => subTotal + shipping;
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}
