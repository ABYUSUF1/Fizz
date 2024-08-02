import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fizz/core/api/end_points.dart';
import 'package:fizz/core/utils/errors/failure.dart';
import 'package:fizz/feature/home/data/models/get_products/get_products.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/utils/errors/server_failure.dart';
import '../models/get_collections/get_collections.dart';
import 'home_repo.dart';

class HomeRepoImple implements HomeRepo {
  final DioConsumer dioConsumer;
  HomeRepoImple({required this.dioConsumer});

  @override
  Future<Either<Failure, List<GetCollections>>> getCollection() async {
    try {
      final result = await dioConsumer.get(EndPoint.getCollections);

      List<GetCollections> collections = [];
      for (var item in result['data']['collections']['edges']) {
        collections.add(GetCollections.fromJson(item['node']));
      }

      return right(collections);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<GetProducts>>> getProducts() async {
    try {
      final result = await dioConsumer.get(EndPoint.getAllProducts);
      List<GetProducts> products = [];

      for (var item in result['data']['products']['edges']) {
        products.add(GetProducts.fromJson(item['node']));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
