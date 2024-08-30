import 'package:flutter/material.dart';
import 'package:taskforbdcalling/utility/app_theme_data.dart';
import 'package:taskforbdcalling/views/button_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      theme: AppThemeData.lightThemeData,
      debugShowCheckedModeBanner: false,
      home: const ButtonsScreen(),

    );
  }
}



