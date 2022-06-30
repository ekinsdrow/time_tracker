import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';
part 'add_category_bloc.freezed.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc() : super(_Initial()) {
    on<AddCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
