class User {
  User({
    required this.id,
    required this.email,
    this.nickname,
  });

  int id;
  String email;
  String? nickname;
}
