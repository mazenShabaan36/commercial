part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class GetCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final int index;
  IncreaseQuantity(this.index);
}

class DecreaseQuantity extends CartEvent {
  final int index;
  DecreaseQuantity(this.index);
}

class RemoveItem extends CartEvent {
  final int index;
  RemoveItem(this.index);
}
