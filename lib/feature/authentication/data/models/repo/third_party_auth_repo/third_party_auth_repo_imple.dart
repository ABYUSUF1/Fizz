import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../../core/utils/errors/auth_failure.dart';
import '../../../../../../core/utils/errors/failure.dart';
import 'third_party_auth_repo.dart';

class ThirdPartyAuthRepoImple implements ThirdPartyAuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(AuthFailure('Google sign-in was cancelled.'));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      print('---------------------------------------------------------111111');
      print(e.toString());
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } on PlatformException catch (e) {
      print('---------------------------------------------------------2222222');
      print(e.toString());
      if (e.code == 'sign_in_failed') {
        return Left(AuthFailure('Google sign-in failed. Please try again.'));
      } else if (e.code == 'network_error') {
        return Left(AuthFailure(
            'Network error, Please check your internet connection.'));
      }
      return Left(AuthFailure('An unknown error occurred'));
    } catch (e) {
      print('---------------------------------------------------------3333333');
      print(e.toString());
      return Left(AuthFailure(e.toString()));
    }
  }
}
