import 'package:nibble_app/app/locator.dart';
import 'package:nibble_app/app/route_names.dart';
import 'package:nibble_app/data/models/meal_model.dart';
import 'package:nibble_app/services/meal_planner_service.dart';
import 'package:nibble_app/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class WeekViewModel extends ReactiveViewModel {
  MealPlannerService _mealPlannerService = locator<MealPlannerService>();
  NavigationService _navigationService = locator<NavigationService>();

  List<WeekMealListModel> get weekMeals => _mealPlannerService.weekMeals;

  void addMeal(DateTime date) async {
    String? meal = await _navigationService.navigateTo(mealListViewRoute);
    if (meal != null) {
      _mealPlannerService.addMeal(meal, date);
    }
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_mealPlannerService];
}
