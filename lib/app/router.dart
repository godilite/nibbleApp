import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibble_app/app/route_names.dart';
import 'package:nibble_app/ui/views/day/day_view.dart';
import 'package:nibble_app/ui/views/meal_list/meal_list_view.dart';
import 'package:nibble_app/ui/views/tabs/tab_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dayViewRoute:
      return _getMaterialPageRoute(
        routeName: settings.name!,
        viewToShow: DayView(),
      );
    case tabViewRoute:
      return _getMaterialPageRoute(
        routeName: settings.name!,
        viewToShow: TabView(),
      );
    case mealListViewRoute:
      return _getMaterialPageRoute(
        routeName: settings.name!,
        viewToShow: MealListView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getMaterialPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow!);
}
