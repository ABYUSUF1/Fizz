import 'package:animate_do/animate_do.dart';
import 'package:fizz/feature/authentication/presentation/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../app_assets.dart';
import '../../../data/models/repo/sign_up_repo/sign_up_repo_imple.dart';
import 'custom_Auth_button.dart';
import 'custom_text_form_field.dart';

class SignUpMobileView extends StatelessWidget {
  const SignUpMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(SignUpRepoImple()),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final SignUpCubit cubit = context.read<SignUpCubit>();
          String? failureMessage;
          if (state is SignUpFailure) {
            failureMessage = state.errMessage;
          }
          return Form(
            key: cubit.signUpFormKey,
            child: FadeInDown(
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
                      child: Lottie.asset(Assets.lottiesSignUpBlackAnimation),
                    ),
                    CustomTextFormField(
                      labelText: 'E-Mail',
                      controller: cubit.emailController,
                    ),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: cubit.passwordController,
                    ),
                    CustomTextFormField(
                      labelText: 'Confirm Password',
                      controller: cubit.confirmPasswordController,
                      passwordController: cubit.passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomAuthButton(
                      loadingState: state is SignUpLoading,
                      successState: state is SignUpSuccess,
                      failureState: state is SignUpFailure,
                      failureText: failureMessage,
                      onTap: () {
                        cubit.signUpWithEmailAndPassword();
                      },
                      child: const Text('Create Account'),
                    ),
                    state is SignUpFailure
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
