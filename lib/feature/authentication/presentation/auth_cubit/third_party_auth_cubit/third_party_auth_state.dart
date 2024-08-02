part of 'third_party_auth_cubit.dart';

@immutable
sealed class ThirdPartyAuthState {}

final class ThirdPartyAuthInitial extends ThirdPartyAuthState {}

final class ThirdPartyAuthGoogleLoading extends ThirdPartyAuthState {}

final class ThirdPartyAuthGoogleSuccess extends ThirdPartyAuthState {}

final class ThirdPartyAuthGoogleFailure extends ThirdPartyAuthState {
  final String errMessage;

  ThirdPartyAuthGoogleFailure({required this.errMessage});
}

// In future we will use facebook and apple too
