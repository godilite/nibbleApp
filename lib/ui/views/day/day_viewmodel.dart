import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nibble_app/app/locator.dart';
import 'package:nibble_app/services/meal_planner_service.dart';
import 'package:stacked/stacked.dart';

class DayViewModel extends ReactiveViewModel {
  MealPlannerService _mealPlannerService = locator<MealPlannerService>();

  String get selectedDate => _mealPlannerService.selectedDate;

  Future<Null> selectTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1969, 1, 1),
        lastDate: DateTime(2069, 1, 1),
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

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_mealPlannerService];
}
