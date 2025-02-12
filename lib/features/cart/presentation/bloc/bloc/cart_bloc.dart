import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../products/data/models/products/products.dart';
import '../../../domain/usecases/cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCarts getCart;
  CartBloc({required this.getCart}) : super(CartInitial()) {
    on<GetCart>((event, emit) async {
      emit(CartLoading());
      final result = await getCart(NoParams());
      result.fold(
        (failure) => emit(CartError(message: failure.message)),
        (data) => emit(CartLoaded(cartProducts: data)),
      );
    });
    on<IncreaseQuantity>((event, emit) {
      final currentState = state;
      if (currentState is CartLoaded) {
        final updatedItems = List<Products>.from(currentState.cartProducts);
        updatedItems[event.index] = updatedItems[event.index]
            .copyWith(quantity: updatedItems[event.index].quantity + 1);
        emit(CartLoaded(cartProducts: updatedItems));
      }
    });
    on<DecreaseQuantity>((event, emit) {
      final currentState = state;
      if (currentState is CartLoaded) {
        final updatedItems = List<Products>.from(currentState.cartProducts);
        if (updatedItems[event.index].quantity > 1) {
          updatedItems[event.index] = updatedItems[event.index]
              .copyWith(quantity: updatedItems[event.index].quantity - 1);
          emit(CartLoaded(cartProducts: updatedItems));
        }
      }
    });
    on<RemoveItem>((event, emit) {
      final currentState = state;
      if (currentState is CartLoaded) {
        final updatedItems = List<Products>.from(currentState.cartProducts)
          ..removeAt(event.index);
        emit(CartLoaded(cartProducts: updatedItems));
      }
    });
  }
}
