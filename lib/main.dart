import 'package:flutter/material.dart';
import 'package:weather_app/splash_screen.dart';
// import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home:  const SplashScreen(),
    );
  }
}