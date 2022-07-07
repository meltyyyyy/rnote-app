import 'package:rnote_app/models/recipe.dart';

import 'ingredient.dart';

class RNote {
  RNote(
      {required this.id,
      this.date,
      required this.recipes,
      required this.ingredients});
  int id;
  DateTime? date;
  List<Recipe> recipes;
  List<Ingredient> ingredients;
}
