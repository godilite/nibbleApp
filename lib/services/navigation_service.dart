import 'package:flutter/material.dart';
import 'package:observable_ish/value/value.dart';
import 'package:stacked/stacked.dart';

class NavigationService with ReactiveServiceMixin {
  NavigationService() {
    listenToReactiveValues([_currentNavbarIndex]);
  }

  RxValue<int> _currentNavbarIndex = RxValue<int>(0);

  int get currentNavbarIndex => _currentNavbarIndex.value;

  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop() {
    return _navigationKey.currentState!.pop();
  }

  void navbarToIndex(int index) {
    _currentNavbarIndex.value = index;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> clearLastAndNavigateTo(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> removeAllAndNavigateTo(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState!
        //.pushNamed(routeName, arguments: arguments);
        //.pushAndRemoveUntil();
        .pushNamedAndRemoveUntil(routeName, (r) => false, arguments: arguments);
  }
}
