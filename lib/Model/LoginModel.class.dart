class LoginModel {
  final String _storedEmail = "test@gmail.com";
  final String _storedPassword = "12345678";

  bool validateCredentials(String email, String password) {
    return email == _storedEmail && password == _storedPassword;
  }
}
