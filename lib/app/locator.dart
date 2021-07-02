import 'package:get_it/get_it.dart';
import 'package:nibble_app/services/meal_planner_service.dart';
import 'package:nibble_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => MealPlannerService());
}
