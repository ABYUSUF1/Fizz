part of 'get_collection_cubit.dart';

@immutable
sealed class GetCollectionState {}

final class GetCollectionInitial extends GetCollectionState {}

final class GetCollectionLoading extends GetCollectionState {}

final class GetCollectionSuccess extends GetCollectionState {
  final List<GetCollections> collections;
  GetCollectionSuccess(this.collections);
}

final class GetCollectionFailure extends GetCollectionState {
  final String errMessage;
  GetCollectionFailure({required this.errMessage});
}
