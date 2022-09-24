import 'package:flutter/material.dart';
import 'package:my_planets_app/data_dummy/dummy_planets.dart';
import 'package:my_planets_app/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences myPreferences;

void main() {
  runApp(const MyApp());
  getData();
}

Future getData() async {
  myPreferences = await SharedPreferences.getInstance();

  for (var element in myPlanets) {
    bool? b = myPreferences.getBool('Fav: ${element.id.toString()}');

    element.isFavourite = b ?? false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPlanetsApp',
      themeMode: ThemeMode.system,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.tealAccent,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      ),
      home: const SplashScreen(),
    );
  }
}
