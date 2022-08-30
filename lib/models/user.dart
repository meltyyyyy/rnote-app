import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(int id, String email, {String? nickname}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

const User initialUser = User(0, '');
