import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_mvvm_3st/ViewModels/PasswordController.dart';
import 'package:hw_mvvm_3st/ViewModels/login_controller.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.find();
    final LoginController loginController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[700],
          ),
        ),
        SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Obx(() {
            return TextField(
              obscureText: passwordController.obscureText.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordController.obscureText.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: passwordController.togglePasswordVisibility,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
              onChanged: (password) {
                loginController.setPassword(password);
              },
            );
          }),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.green[800],
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
