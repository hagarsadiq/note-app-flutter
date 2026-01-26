import 'package:flutter/material.dart';
import 'package:untitled11/View/login.dart';
import 'package:untitled11/View/splash.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      builder: (context,child) {
        return Directionality(textDirection: TextDirection.rtl,child: child!,);
      },
      home:Splashscreen(),
    );
  }
}