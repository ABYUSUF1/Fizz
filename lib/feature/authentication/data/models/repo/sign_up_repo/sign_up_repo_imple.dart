import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/utils/errors/auth_failure.dart';
import '../../../../../../core/utils/errors/failure.dart';
import 'sign_up_repo.dart';

class SignUpRepoImple implements SignUpRepo {
  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
