import 'package:flutter/material.dart';

class archive extends StatelessWidget {
  const archive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("الأرشيف"),
        backgroundColor: Colors.blue,

      ),

      body: Center(
        child: Text(
          "صفحة الأرشيف",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}