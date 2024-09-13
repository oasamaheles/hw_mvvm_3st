import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_mvvm_3st/View/EmailInput.dart';
import 'package:hw_mvvm_3st/View/PasswordInput.dart';
import 'package:hw_mvvm_3st/ViewModels/PasswordController.dart';
import 'package:hw_mvvm_3st/ViewModels/login_controller.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final PasswordController passwordController = Get.put(PasswordController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header Section
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's get started",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),

            EmailInput(),
            SizedBox(height: 16),
            PasswordInput(),

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                loginController.login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                textStyle: TextStyle(fontSize: 16),
                fixedSize: Size(double.maxFinite, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 20),

            Text(
              "Or log in with your social account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.blueGrey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
