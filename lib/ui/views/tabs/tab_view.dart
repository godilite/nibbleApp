import 'package:flutter/material.dart';
import 'package:nibble_app/ui/views/day/day_view.dart';
import 'package:nibble_app/ui/views/tabs/tab_viewmodel.dart';
import 'package:nibble_app/ui/views/week/week_view.dart';
import 'package:stacked/stacked.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabViewModel>.reactive(
        viewModelBuilder: () => TabViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
              child: IndexedStack(
                index: model.currentIndex,
                children: [
                  for (final tabItem in BottomAppBarItem.items) tabItem.page,
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.light_mode_rounded),
                  label: 'Days',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Weeks',
                ),
              ],
              currentIndex: model.currentIndex,
              selectedItemColor: Colors.blue.shade900,
              onTap: (int index) => model.navigateTo(index),
            ),
          );
        });
  }
}

class BottomAppBarItem {
  BottomAppBarItem({required this.page});
  Widget page;

  static List<BottomAppBarItem> get items => [
        BottomAppBarItem(
          page: DayView(),
        ),
        BottomAppBarItem(
          page: WeekView(),
        ),
      ];
}
