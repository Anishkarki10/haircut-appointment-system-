import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'barber_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KapalTime',
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: const BarberDetailsScreen(),
    );
  }
}