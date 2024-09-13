import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_mvvm_3st/ViewModels/login_controller.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[700],
          ),
        ),
        SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              hoverColor: Colors.white,
            ),
            onChanged: (email) {
              loginController.setEmail(email);
            },
          ),
        ),
      ],
    );
  }
}
