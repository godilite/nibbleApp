import 'package:flutter/material.dart';
import 'package:nibble_app/app/locator.dart';
import 'package:nibble_app/app/route_names.dart';
import 'package:nibble_app/data/models/meal_model.dart';
import 'package:nibble_app/services/meal_planner_service.dart';
import 'package:nibble_app/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class DayViewModel extends ReactiveViewModel {
  MealPlannerService _mealPlannerService = locator<MealPlannerService>();
  NavigationService _navigationService = locator<NavigationService>();
  String get selectedDateString => _mealPlannerService.selectedDate;
  DateTime get selectedDateTime => _mealPlannerService.selectedDateTime;
  DateTime _currentDate = DateTime.now();

  List<MealModel> get dailyMeals => _mealPlannerService.dayMeals;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate:
            _currentDate.subtract(Duration(days: _currentDate.weekday - 1)),
        lastDate: _currentDate
            .add(Duration(days: DateTime.daysPerWeek - _currentDate.weekday)),
        initialDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });
    if (picked != null) _mealPlannerService.selectDate(picked);
    notifyListeners();
  }

  void addMeal() async {
    String? meal = await _navigationService.navigateTo(mealListViewRoute);
    if (meal != null) _mealPlannerService.addMeal(meal, selectedDateTime);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_mealPlannerService];
}
