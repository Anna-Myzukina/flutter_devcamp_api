import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/screen/my_home_screen.dart';
import 'package:flutter_devcamp_api/screen/weather_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API app',
      home: WeatherScreen(),
    );
  }
}

