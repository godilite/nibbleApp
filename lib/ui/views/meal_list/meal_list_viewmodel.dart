import 'package:nibble_app/data/repository/repository.dart';
import 'package:stacked/stacked.dart';

class MealListViewModel extends BaseViewModel {
  List<String> get mealList => repository.mealList;
}
