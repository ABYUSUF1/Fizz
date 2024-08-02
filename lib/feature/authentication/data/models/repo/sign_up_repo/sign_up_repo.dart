import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/utils/errors/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password});
}
