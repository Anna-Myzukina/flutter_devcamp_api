import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/screen/my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API app',
      home: MyHomeScreen(),
    );
  }
}

