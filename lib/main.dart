import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_mvvm_3st/View/HomeScreen.dart';
import 'package:hw_mvvm_3st/View/login_page.dart';
import 'package:hw_mvvm_3st/ViewModels/ItemController.dart';
import 'package:hw_mvvm_3st/ViewModels/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  Get.put(ItemController());
  Get.put(LoginController());
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MvvM Hw',
      home: isLoggedIn ? HomeScreen() : LoginPage(),
    );
  }
}
