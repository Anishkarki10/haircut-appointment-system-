import 'register_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'customer_discover.dart';

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
              backgroundColor: Colors.white
          )
      ),
      home:   LoginScreen(),
    );
  }
}
