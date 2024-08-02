import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/utils/errors/failure.dart';

abstract class ThirdPartyAuthRepo {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  // Future<UserCredential> signInWithFacebook();
  // Future<UserCredential> signInWithApple();
}
