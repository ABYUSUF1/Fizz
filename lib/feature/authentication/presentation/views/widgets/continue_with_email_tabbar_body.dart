import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/models/repo/sign_in_repo/sign_in_repo_imple.dart';
import '../../../data/models/repo/sign_up_repo/sign_up_repo_imple.dart';
import '../../auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import '../../auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'sign_in_mobile_view.dart';
import 'sign_up_mobile_view.dart';

class ContinueWithEmailTabBarBody extends StatelessWidget {
  final TabController tabController;
  const ContinueWithEmailTabBarBody({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          height: 430,
          color: whiteColor,
          child: TabBarView(controller: tabController, children: [
            BlocProvider(
              create: (context) => SignInCubit(SignInRepoImple()),
              child: const SignInMobileView(),
            ),
            BlocProvider(
              create: (context) => SignUpCubit(SignUpRepoImple()),
              child: const SignUpMobileView(),
            ),
          ]),
        ));
  }
}
