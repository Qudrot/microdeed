import 'package:flutter/material.dart';
import 'package:microdeed/design_system/themes.dart';
import 'package:microdeed/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microdeed App',
      theme: dsTheme(),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
