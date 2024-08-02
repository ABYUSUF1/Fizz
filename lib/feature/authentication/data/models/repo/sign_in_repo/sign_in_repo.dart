import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/utils/errors/failure.dart';

abstract class SignInRepo {
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
}
