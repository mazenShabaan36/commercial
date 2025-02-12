import 'package:commercial/core/widgets/custom_search_filed.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/size.dart';
import '../../../products/presentation/bloc/bloc/products_bloc.dart';
import '../../../products/presentation/widgets/products_grid_view.dart';
import '../bloc/bloc/category_bloc.dart';
import '../widgets/categories_list.dart';
import '../widgets/offers_card.dart';
import '../widgets/welcoming_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => sl<ProductsBloc>()..add(FetchProducts()),
        child: SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width(context) * 0.04,
                  vertical: height(context) * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomingRow(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.01),
                    child: CustomSearchFiled(
                        textEditingController: TextEditingController()),
                  ),
                  const OffersCard(),
                  SizedBox(height: height(context) * 0.02),
                  BlocProvider(
                      create: (context) => GetIt.I<CategoryBloc>()..add(FetchCategories()),
                    child: const CategoriesList(),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  const ProductsGridView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
