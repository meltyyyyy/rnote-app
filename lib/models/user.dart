class User {
  User(
      {required this.id,
      required this.email,
      this.name,
      this.nickname,
      this.age});

  int id;
  String email;
  String? name;
  String? nickname;
  int? age;
}
