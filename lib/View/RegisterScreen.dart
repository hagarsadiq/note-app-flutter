import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<Map<String, String>> users = [];

  void register() {
    if(nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) return;

    users.add({
      "name": nameController.text,
      "mail": emailController.text,
      "pass": passwordController.text,
    });

    nameController.clear();
    emailController.clear();
    passwordController.clear();

    Get.off(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('create_account'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: Text('create_account'.tr),
            ),
          ],
        ),
      ),
    );
  }
}