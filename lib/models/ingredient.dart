class Ingredient {
  Ingredient(
      {required this.id,
      required this.name,
      required this.unit,
      this.memo = '',
      this.quantity});
  int id;
  String name;
  String unit;
  String? quantity;
  String memo;
}
