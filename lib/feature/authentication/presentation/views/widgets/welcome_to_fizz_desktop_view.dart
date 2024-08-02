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

class WelcomeToFizzDesktopView extends StatelessWidget {
  const WelcomeToFizzDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: size.width / 1.5,
          height: 500,
          color: whiteColor,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    Assets.imagesWomanModel,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 70, bottom: 50, right: 50),
                  child: Column(
                    children: [
                      const Text('Welcome To Fizz',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const Text(
                        'Discover  Shop  Enjoy!',
                      ),
                      const Spacer(),
                      BlocProvider(
                        create: (context) =>
                            ThirdPartyAuthCubit(ThirdPartyAuthRepoImple()),
                        child: BlocBuilder<ThirdPartyAuthCubit,
                            ThirdPartyAuthState>(
                          builder: (context, state) {
                            String? failureMessage;
                            if (state is ThirdPartyAuthGoogleFailure) {
                              failureMessage = state.errMessage;
                            }
                            return CustomAuthButton(
                              loadingState:
                                  state is ThirdPartyAuthGoogleLoading,
                              successState:
                                  state is ThirdPartyAuthGoogleSuccess,
                              failureState:
                                  state is ThirdPartyAuthGoogleFailure,
                              failureText: failureMessage,
                              onTap: () {
                                context
                                    .read<ThirdPartyAuthCubit>()
                                    .signInWithGoogle();
                              },
                              child: Row(
                                children: [
                                  const Text(
                                    'Continue with google  ',
                                    style: TextStyle(color: whiteColor),
                                  ),
                                  SvgPicture.asset(Assets.imagesGoogleLogo,
                                      width: 20, height: 20),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomAnimatedButton(
                        width: size.width / 3,
                        height: 60,
                        delay: 250,
                        onTap: () {
                          Navigator.push(
                              context,
                              customPageTransition(
                                  page: const ContinueWithEmailView(),
                                  direction: SlideDirection.down));
                        },
                        buttonColor: const Color.fromARGB(255, 235, 235, 235),
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Continue with Email  ',
                              style: TextStyle(color: blackColor),
                            ),
                            SvgPicture.asset(Assets.imagesEmailIcon,
                                width: 20, height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
