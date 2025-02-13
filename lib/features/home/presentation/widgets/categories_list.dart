import 'package:commercial/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/size.dart';
import '../../../products/presentation/bloc/bloc/products_bloc.dart';
import '../bloc/bloc/category_bloc.dart';
import 'category_list_loading.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const CategoryListLoading();
        } else if (state is CategoryLoaded) {
          final categories = ['All', ...state.data];

          return SizedBox(
            height: height(context) * 0.04,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (categories[index] == 'All') {
                          context
                              .read<CategoryBloc>()
                              .add(SelectCategory(categories[index]));

                          // Dispatch FetchProductsWithCategory event to ProductsBloc
                          context.read<ProductsBloc>().add(
                                FetchProducts(),
                              );
                        } else {
                          context
                              .read<CategoryBloc>()
                              .add(SelectCategory(categories[index]));

                          // Dispatch FetchProductsWithCategory event to ProductsBloc
                          context.read<ProductsBloc>().add(
                                FetchProductsWithCategory(
                                  params: categories[index],
                                ),
                              );
                        }
                      },
                      child: CategoryCard(
                        categories: categories,
                        index: index,
                        isSelected: categories[index] == state.selectedCategory,
                      ),
                    ),
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
