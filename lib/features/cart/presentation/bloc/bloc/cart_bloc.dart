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
  }
}
