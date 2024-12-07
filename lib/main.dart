import 'package:flutter/material.dart';
import 'package:netflixclonesecond/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix clone',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(bodyLarge:TextStyle(color: Colors.white),bodyMedium: TextStyle(color: Colors.white) ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
        useMaterial3: true,
      ),
     home: const HomeScreen(),
    );
  }
}


