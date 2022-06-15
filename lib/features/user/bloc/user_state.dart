part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.login({
    required UserModel user,
  }) = _Login;
  const factory UserState.logout() = _Logout;
}
