// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqf_sample_project/controller/home_screen_controller.dart';
import 'package:sqf_sample_project/view/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
