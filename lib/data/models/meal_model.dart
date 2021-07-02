class MealModel {
  MealModel({this.title, this.month, this.weekNo, this.day});
  String? title;
  int? month;
  int? weekNo;
  int? day;
}

class WeekMealListModel {
  WeekMealListModel({this.day, this.meals, this.date});

  String? day;
  DateTime? date;
  List<MealModel>? meals;
}
