import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_auth_info_model/user_auth_info_model.dart';
import '../../../data/models/repo/sign_in_repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo _signInRepo;
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInCubit(this._signInRepo) : super(SignInInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  // Method to handle sign-in with email and password
  Future<void> signInWithEmailAndPassword() async {
    if (signInFormKey.currentState?.validate() ?? false) {
      emit(SignInLoading());

      final result = await _signInRepo.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      result.fold(
        (failure) => emit(SignInFailure(errMessage: failure.errMessage)),
        (credential) async {
          if (credential.user?.emailVerified ?? false) {
            UserAuthInfoModel(user: credential.user!);
            emit(SignInSuccess());
          } else {
            await credential.user?.sendEmailVerification();
            emit(SignInFailure(
                errMessage: 'Email not verified. Please verify your email.'));
          }
        },
      );
    }
  }

  // Method to handle forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    emit(SignInLoading());

    final result = await _signInRepo.sendPasswordResetEmail(email);

    result.fold(
      (failure) => emit(SignInFailure(errMessage: failure.errMessage)),
      (_) => emit(SignInSuccess()),
    );
  }
}
