import 'dart:async';
import 'package:flutter/material.dart';
import 'create.dart';
import 'login.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login ()), (route) => false,);});
    super.initState();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note, color: Colors.white, size: 80),
            SizedBox(height: 10),
            Text("Google note", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold,),),],),
      ),
    );
  }
}