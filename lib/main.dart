import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parsul',
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize the theme later
        scaffoldBackgroundColor: const Color(0xFFF8F8F8), // Light background similar to Figma
        fontFamily: 'YourFontFamily', // Replace with your actual font if you have one
      ),
      home: const HomeScreen(), // Set HomeScreen as the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}