import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'RegisterScreen.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'username'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(username.text == "hagar" && password.text == "112233") {
                  Get.off(() => home());
                } else {
                  Get.snackbar('error'.tr, 'wrong_credentials'.tr,
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              child: Text('login'.tr),
            ),
            TextButton(
              onPressed: () => Get.to(() => RegisterScreen()),
              child: Text('create_account'.tr),
            ),
          ],
        ),
      ),
    );
  }
}