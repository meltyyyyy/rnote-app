class Recipe {
  Recipe(
      {required this.id,
      required this.name,
      required this.unit,
      this.quantity});
  int id;
  String name;
  String unit;
  String? quantity;
}
