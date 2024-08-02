import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/repo/sign_up_repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (!signUpFormKey.currentState!.validate()) return;

    emit(SignUpLoading());

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final result = await _signUpRepo.signUpWithEmailAndPassword(
        email: email, password: password);

    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
      (userCredential) => emit(SignUpSuccess()),
    );
  }
}
