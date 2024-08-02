import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/get_products/get_products.dart';
import '../../../data/repo/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());

  final HomeRepo homeRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await homeRepo.getProducts();

    result.fold(
      (failure) => emit(GetProductsFailure(errMessage: failure.errMessage)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }
}
