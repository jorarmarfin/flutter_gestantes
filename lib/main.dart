import 'package:flutter/material.dart';

import 'screens/screens.dart';
import 'themes/default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nutrigest',
        theme: DefaultTheme.base,
        initialRoute: HomeScreen.routerName,
        routes: {
          HomeScreen.routerName: (context) => const HomeScreen(),
        });
  }
}
