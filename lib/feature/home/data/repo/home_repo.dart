import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../models/get_collections/get_collections.dart';
import '../models/get_products/get_products.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<GetCollections>>> getCollection();

  Future<Either<Failure, List<GetProducts>>> getProducts();
}
