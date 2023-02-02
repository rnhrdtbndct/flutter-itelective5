// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:itelective5/screens/about.dart';
import 'package:itelective5/screens/home.dart';
import 'package:itelective5/screens/login.dart';
import 'package:itelective5/screens/signup.dart';
import 'package:itelective5/elements/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginScreen(),
      '/signup': (context) => SignUpScreen(),
      '/home': (context) => HomeScreen(),
      '/about': (context) => AboutScreen(),
    }
    );
  }
}
