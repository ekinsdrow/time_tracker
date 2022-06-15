import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserModelFromJson(
        json,
      );
}
