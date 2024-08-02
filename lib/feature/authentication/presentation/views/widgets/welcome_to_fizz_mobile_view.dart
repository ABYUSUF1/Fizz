import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app_assets.dart';
import '../../../../../core/utils/animations/animated_button.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/custom_page_transition.dart';
import '../../../data/models/repo/third_party_auth_repo/third_party_auth_repo_imple.dart';
import '../../auth_cubit/third_party_auth_cubit/third_party_auth_cubit.dart';
import '../continue_with_email_view.dart';
import 'custom_Auth_button.dart';

class WelcomeToFizzMobileView extends StatelessWidget {
  const WelcomeToFizzMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: size.width / 1.5,
          height: 500,
          color: whiteColor,
          child: Column(
            children: [
              const Text('Welcome To Fizz',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text('Discover  Shop  Enjoy!'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BlocProvider(
                    create: (context) =>
                        ThirdPartyAuthCubit(ThirdPartyAuthRepoImple()),
                    child:
                        BlocBuilder<ThirdPartyAuthCubit, ThirdPartyAuthState>(
                      builder: (context, state) {
                        String? failureMessage;
                        if (state is ThirdPartyAuthGoogleFailure) {
                          failureMessage = state.errMessage;
                        }
                        return CustomAuthButton(
                          loadingState: state is ThirdPartyAuthGoogleLoading,
                          successState: state is ThirdPartyAuthGoogleSuccess,
                          failureState: state is ThirdPartyAuthGoogleFailure,
                          failureText: failureMessage,
                          onTap: () {
                            context
                                .read<ThirdPartyAuthCubit>()
                                .signInWithGoogle();
                          },
                          child: Column(
                            children: [
                              const Text(
                                'Continue with google',
                                style: TextStyle(color: whiteColor),
                              ),
                              const SizedBox(height: 5),
                              SvgPicture.asset(
                                Assets.imagesGoogleLogo,
                                width: 25,
                                height: 25,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  CustomAnimatedButton(
                    width: size.width / 3.5,
                    height: 70,
                    delay: 250,
                    onTap: () {
                      Navigator.push(
                          context,
                          customPageTransition(
                              page: const ContinueWithEmailView(),
                              direction: SlideDirection.down));
                    },
                    buttonColor: const Color.fromARGB(255, 235, 235, 235),
                    childWidget: FittedBox(
                      child: Column(
                        children: [
                          const Text(
                            'Continue with email',
                            style: TextStyle(color: blackColor),
                          ),
                          const SizedBox(height: 5),
                          SvgPicture.asset(
                            Assets.imagesEmailIcon,
                            width: 25,
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Image.asset(
                  Assets.imagesWomanModel,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
