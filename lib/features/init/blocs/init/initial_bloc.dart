import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_event.dart';
part 'initial_state.dart';
part 'initial_bloc.freezed.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(const _Loading()) {
    on<InitialEvent>(_onStarted);
  }

  Future<FutureOr<void>> _onStarted(
    InitialEvent event,
    Emitter<InitialState> emit,
  ) async {
    emit(const InitialState.loading());

    //TODO: add initialization
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    emit(const InitialState.success());
  }
}
