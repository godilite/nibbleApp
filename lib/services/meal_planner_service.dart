import 'package:jiffy/jiffy.dart';
import 'package:nibble_app/data/models/meal_model.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class MealPlannerService with ReactiveServiceMixin {
  MealPlannerService() {
    listenToReactiveValues([
      _currentWeek,
      _selectedDateString,
      _selectedDateTime,
      _selectedMealList,
      _dayMeals
    ]);
  }
  RxValue<List<MealModel>> _selectedMealList = RxValue<List<MealModel>>([]);
  RxValue<int> _currentWeek = RxValue<int>(Jiffy(DateTime.now()).week);
  RxValue<List<MealModel>> _dayMeals = RxValue<List<MealModel>>([]);

  RxValue<List<WeekMealListModel>> _weekMeals =
      RxValue<List<WeekMealListModel>>([]);

  RxValue<int> _day = RxValue<int>(Jiffy(DateTime.now()).day);
  RxValue<int> _month = RxValue<int>(Jiffy(DateTime.now()).month);
  RxValue<DateTime> _selectedDateTime = RxValue<DateTime>(DateTime.now());

  RxValue<String> _selectedDateString =
      RxValue<String>(Jiffy(DateTime.now()).format("do MMMM"));

  int get currentWeek => _currentWeek.value;
  String get selectedDate => _selectedDateString.value;
  List<MealModel> get selectedMealList => _selectedMealList.value;
  List<MealModel> get dayMeals => _dayMeals.value;
  List<WeekMealListModel> get weekMeals => _weekMeals.value;
  DateTime get selectedDateTime => _selectedDateTime.value;
  DateTime _currentDate = DateTime.now();

  void selectDate(DateTime date) {
    _selectedDateTime.value = date;
    _selectedDateString.value = Jiffy(date).format("do MMMM");
    _currentWeek.value = Jiffy(date).week;
    _day.value = Jiffy(date).day;
    _month.value = Jiffy(date).day;
    getDailyMeals();
  }

  void addMeal(String meal, DateTime date) {
    var mealModel = MealModel(
        weekNo: Jiffy(date).week,
        day: Jiffy(date).day,
        month: Jiffy(date).month,
        title: meal);
    _selectedMealList.value.add(mealModel);
    generateWeekData();
    getDailyMeals();
  }

  void generateWeekData() {
    _weekMeals.value = [];
    //Get the first day of the week
    var firstWeekDay =
        _currentDate.subtract(Duration(days: _currentDate.weekday - 1));
    //Generate all week dates and filter meals by days
    for (var i = 0; i < 7; i++) {
      DateTime date = firstWeekDay.add(Duration(days: i));
      populateWeekMeals(date);
    }
  }

  void populateWeekMeals(date) {
    var title = Jiffy(date).format("do MMMM");
    List<MealModel> meals = selectedMealList
        .where((element) => element.day == Jiffy(date).day)
        .toList();
    _weekMeals.value
        .add(WeekMealListModel(day: title, meals: meals, date: date));
  }

  void getDailyMeals() {
    List<MealModel> meals = selectedMealList
        .where((element) => element.day == Jiffy(selectedDateTime).day)
        .toList();
    _dayMeals.value = meals;
  }
}
