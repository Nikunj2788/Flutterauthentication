import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/signup_page.dart';
import 'package:firebaseapp/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}
