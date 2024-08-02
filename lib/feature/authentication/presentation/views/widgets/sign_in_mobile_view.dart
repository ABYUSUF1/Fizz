import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../app_assets.dart';
import '../../../data/models/repo/sign_in_repo/sign_in_repo_imple.dart';
import '../../auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import '../widgets/custom_text_form_field.dart';
import 'custom_Auth_button.dart';

class SignInMobileView extends StatelessWidget {
  const SignInMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(SignInRepoImple()),
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final SignInCubit cubit = context.read<SignInCubit>();
          String? failureMessage;
          if (state is SignInFailure) {
            failureMessage = state.errMessage;
          }

          return Form(
            key: cubit.signInFormKey,
            child: FadeInUp(
              delay: const Duration(milliseconds: 500),
              from: 30,
              curve: Curves.ease,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox.square(
                      dimension: 70,
                      child: Lottie.asset(Assets.lottiesSignInBlackAnimation),
                    ),
                    CustomTextFormField(
                        labelText: 'E-Mail', controller: cubit.emailController),
                    CustomTextFormField(
                        labelText: 'Password',
                        controller: cubit.passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          cubit.sendPasswordResetEmail(
                              cubit.emailController.text.trim());
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 10, color: Colors.cyan),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomAuthButton(
                      loadingState: state is SignInLoading,
                      successState: state is SignInSuccess,
                      failureState: state is SignInFailure,
                      failureText: failureMessage,
                      onTap: () {
                        cubit.signInWithEmailAndPassword();
                      },
                      child: const Text('Login'),
                    ),
                    state is SignInFailure
                        ? Text(
                            state.errMessage,
                            style: const TextStyle(
                                color: Colors.redAccent, fontSize: 12),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
