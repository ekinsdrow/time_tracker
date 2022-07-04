import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_activity_model.freezed.dart';
part 'add_activity_model.g.dart';

@freezed
class AddActivityModel with _$AddActivityModel {
  factory AddActivityModel({
    required int duration,
    required String categoryId,
    required DateTime endTimestamp,
    required String userId,
  }) = _AddActivityModel;

  factory AddActivityModel.fromJson(Map<String, dynamic> json) =>
      _$AddActivityModelFromJson(json);
}
