import 'ingredient.dart';

class Recipe {
  Recipe(
      {required this.id,
      required this.name,
      required this.ingredients,
      this.memo = ''});
  int id;
  String name;
  List<Ingredient> ingredients;
  DateTime? date;
  String memo;
}
