import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.logout()) {
    _subscribeOnFirebase();
  }

  void _subscribeOnFirebase() {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user != null) {
          emit(
            _Login(
              user: UserModel(
                email: user.email ?? '',
                uid: user.uid,
              ),
            ),
          );
        } else {
          emit(const _Logout());
        }
      },
    );
  }
}
