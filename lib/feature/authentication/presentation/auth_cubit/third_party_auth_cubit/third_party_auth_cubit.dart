import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/repo/third_party_auth_repo/third_party_auth_repo.dart';

part 'third_party_auth_state.dart';

class ThirdPartyAuthCubit extends Cubit<ThirdPartyAuthState> {
  final ThirdPartyAuthRepo _thirdPartyAuthRepo;
  ThirdPartyAuthCubit(this._thirdPartyAuthRepo)
      : super(ThirdPartyAuthInitial());

  // Method to handle Google sign-in
  Future<void> signInWithGoogle() async {
    emit(ThirdPartyAuthGoogleLoading());

    final result = await _thirdPartyAuthRepo.signInWithGoogle();

    result.fold(
      (failure) =>
          emit(ThirdPartyAuthGoogleFailure(errMessage: failure.errMessage)),
      (userCredential) => emit(ThirdPartyAuthGoogleSuccess()),
    );
  }
}
