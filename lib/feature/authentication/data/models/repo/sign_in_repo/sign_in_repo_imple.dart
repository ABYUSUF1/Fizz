import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizz/core/utils/errors/auth_failure.dart';

import 'sign_in_repo.dart';

class SignInRepoImple implements SignInRepo {
  SignInRepoImple();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Method to Sign in with email and password
  @override
  Future<Either<AuthFailure, UserCredential>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  // Method to reset password if forgotten
  @override
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
