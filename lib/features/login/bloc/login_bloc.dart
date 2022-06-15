import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const _Loading());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(const _Initial());
    } on FirebaseAuthException {
      emit(
        const _Error(
          error: ErrorsStrings.authError,
        ),
      );
    } catch (e) {
      emit(
        const _Error(
          error: ErrorsStrings.unknownError,
        ),
      );
    }
  }
}
