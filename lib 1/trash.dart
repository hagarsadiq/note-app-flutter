import 'package:flutter/material.dart';

class trash extends StatelessWidget {
  //const trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المحذوفات"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "صفحة المحذوفات",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}