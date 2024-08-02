import 'package:cached_network_image/cached_network_image.dart';
import 'package:fizz/feature/home/presentation/view_models/get_products_cubit/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_products/get_products.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProductsFailure) {
              return Center(child: Text(state.errMessage));
            } else if (state is GetProductsSuccess) {
              return ProductsGridView(
                products: state.products,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class ProductsGridView extends StatelessWidget {
  final List<GetProducts> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: products[index].featuredImage!.url!,
            memCacheWidth: 447,
            memCacheHeight: 356,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
      ),
    );
  }
}
