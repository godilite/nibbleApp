import 'package:nibble_app/data/repository/meal_provider.dart';

class Repository {
  final MealProvider _mealProvider = MealProvider();

  List<String> get mealList => _mealProvider.getMealList();
}

final repository = Repository();
