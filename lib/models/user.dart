import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {@Default('') String id,
      @Default('') String email,
      String? nickname}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
