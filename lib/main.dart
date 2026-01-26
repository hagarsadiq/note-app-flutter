import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/note_controller.dart';
import 'View/splash.dart';
import 'View/login.dart';
import 'View/home.dart';

void main() {
  Get.put(NoteController()); // إنشاء الكنترولر
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(), // دعم اللغة
      locale: Locale('ar'),
      fallbackLocale: Locale('er'),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Splashscreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => home()),
      ],
    );
  }
}

// ترجمة بسيطة عربي/انجليزي
class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      'login': 'تسجيل الدخول',
      'create_account': 'إنشاء حساب',
      'notes': 'الملاحظات',
      'archive': 'الأرشيف',
      'tasks': 'المهام',
      'trash': 'المحذوفات',
      'settings': 'الإعدادات',
      'logout': 'تسجيل الخروج',
      'font_size': 'حجم الخط',
      'password':'كلمة المرور',
      'username':'اسم المستخدم',

      'name':'الاسم ',
      'email':'الحساب الالكتروني',
      'add_task':'اضف مهمة ',
      'add':'اضافة ',
      'erorr':'خطا ',





      'change_language':'تغيير اللغة'
    },
    'en': {
      'login': 'Login',
      'create_account': 'Create Account',
      'notes': 'Notes',
      'archive': 'Archive',
      'tasks': 'Tasks',
      'trash': 'Trash',
      'settings': 'Settings',
      'logout': 'Logout',
      'font_size': 'Font Size',
      'erorr':'Erorr',
      'add':'Add',
      'add_task':'Add Task',
      'email':'Email',
      'name':'Name',
      'password':'Password',
      'user_name':'Username',
      'change_language':'Change_Language'
    },
  };
}