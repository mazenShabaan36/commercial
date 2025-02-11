import 'package:bloc/bloc.dart';
import 'package:commercial/features/products/domain/usescases/products_usecase.dart';
import 'package:commercial/features/products/domain/usescases/products_with_category_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecases/usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;
  final GetProductsWithCategory getProductsWithCategory;
  ProductsBloc(
      {required this.getProducts, required this.getProductsWithCategory})
      : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProducts(NoParams());
      result.fold(
        (failure) => emit(ProductsFailure(message: failure.message)),
        (data) => emit(ProductsLoaded(productsList: data)),
      );
    });
    on<FetchProductsWithCategory>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProductsWithCategory(event.params);
      result.fold(
        (failure) => emit(ProductsFailure(message: failure.message)),
        (data) => emit(ProductsLoaded(productsList: data)),
      );
    });
  }
}
