import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/add_activity/data/models/time.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

part 'add_activity_event.dart';
part 'add_activity_state.dart';
part 'add_activity_bloc.freezed.dart';

class AddActivityBloc extends Bloc<AddActivityEvent, AddActivityState> {
  AddActivityBloc() : super(_Initial()) {
    on<AddActivityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
