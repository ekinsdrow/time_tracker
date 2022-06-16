import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const _Initial()) {
    on<SettingsEvent>(_logout);
  }

  Future _logout(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());

    try {
      await FirebaseAuth.instance.signOut();

      emit(const SettingsState.initial());
    } catch (e) {
      emit(
        const SettingsState.error(
          error: ErrorsStrings.logoutError,
        ),
      );
    }
  }
}
