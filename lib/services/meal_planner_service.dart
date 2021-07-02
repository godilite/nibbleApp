import 'package:jiffy/jiffy.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class MealPlannerService with ReactiveServiceMixin {
  MealPlannerService() {
    listenToReactiveValues([_currentWeek]);
  }

  RxValue<int> _currentWeek = RxValue<int>(0);
  RxValue<String> _selectedDate =
      RxValue<String>(Jiffy(DateTime.now()).format("do MMMM"));

  int get currentWeek => _currentWeek.value;
  String get selectedDate => _selectedDate.value;

  void selectDate(DateTime date) {
    _selectedDate.value = Jiffy(date).format("do MMMM");
    _currentWeek.value = Jiffy(date).week;
  }
}
