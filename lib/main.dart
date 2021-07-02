import 'package:flutter/material.dart';

import 'app/locator.dart';
import 'app/route_names.dart';
import 'app/router.dart';
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nibble App',
      navigatorKey: locator<NavigationService>().navigationKey,
      initialRoute: tabViewRoute,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
