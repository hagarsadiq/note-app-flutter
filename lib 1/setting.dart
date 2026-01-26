import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool notifications = true;
  bool darkMode = false;
  double fontSize=22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الإعدادات"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("الإشعارات"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text("الوضع المظلم"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });

            },

          ),
          ListTile(
            title: Text("حجم الخط"),
            subtitle: Slider(
              min: 10,
              max: 32,
              value: fontSize,
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("حول التطبيق"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("عن التطبيق"),
                  content: Text("Google Keep \n "

                      "الاصدار 3.0.2"),
                  actions: [
                    TextButton(
                      child: Text("موافق"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}