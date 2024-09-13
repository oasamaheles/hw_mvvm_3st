import 'package:get/get.dart';
import 'package:hw_mvvm_3st/Model/LoginModel.class.dart';
import 'package:hw_mvvm_3st/View/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../View/login_page.dart';

class LoginController extends GetxController {
  final LoginModel _model = LoginModel();
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void login() async {
    bool isValid = _model.validateCredentials(email.value, password.value);
    if (isValid) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Get.offAll(() => HomeScreen()); // Navigate to HomeScreen
    } else {
      Get.snackbar(
        'Login Status',
        'Invalid Credentials',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Get.offAll(() => LoginPage());
  }
}
