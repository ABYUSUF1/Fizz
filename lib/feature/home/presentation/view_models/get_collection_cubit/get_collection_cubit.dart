import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/get_collections/get_collections.dart';
import '../../../data/repo/home_repo.dart';

part 'get_collection_state.dart';

class GetCollectionCubit extends Cubit<GetCollectionState> {
  GetCollectionCubit(this.homeRepo) : super(GetCollectionInitial());

  final HomeRepo homeRepo;

  Future<void> getCollection() async {
    emit(GetCollectionLoading());

    final result = await homeRepo.getCollection();

    result.fold(
      (failure) => emit(GetCollectionFailure(errMessage: failure.errMessage)),
      (collections) => emit(GetCollectionSuccess(collections)),
    );
  }
}
