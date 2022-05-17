import 'package:flutter/material.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';
import 'themes/default_theme.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DrupalProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nutrigest',
        theme: DefaultTheme.base,
        initialRoute: AplicacionesScreen.routerName,
        routes: {
          HomeScreen.routerName: (context) => const HomeScreen(),
          GestanteScreen.routerName: (context) => const GestanteScreen(),
          ProfesionalScreen.routerName: (context) => const ProfesionalScreen(),
          NutricionistaScreen.routerName: (context) =>
              const NutricionistaScreen(),
          PresentacionScreen.routerName: (context) =>
              const PresentacionScreen(),
          AplicacionesScreen.routerName: (context) =>
              const AplicacionesScreen(),
          CompartirScreen.routerName: (context) => const CompartirScreen(),
        });
  }
}
