import 'package:firebase_auth/firebase_auth.dart';

import 'failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return AuthFailure(' The email or password might be incorrect');
      case 'email-already-in-use':
        return AuthFailure('The email address is already in use.');
      case 'invalid-email':
        return AuthFailure('Invalid email address.');
      case 'user-disabled':
        return AuthFailure('Account disabled.');
      case 'user-not-found':
        return AuthFailure('User not found.');
      case 'wrong-password':
        return AuthFailure('Incorrect password.');
      case 'account-exists-with-different-credential':
        return AuthFailure('Account exists with different credentials.');
      case 'user-cancelled':
        return AuthFailure('Sign-in cancelled.');
      case 'network-request-failed':
        return AuthFailure('Network error. Please check your connection.');
      case 'too-many-requests':
        return AuthFailure('Too many requests. Please try again later.');
      default:
        return AuthFailure('An unexpected error occurred.');
    }
  }
}
