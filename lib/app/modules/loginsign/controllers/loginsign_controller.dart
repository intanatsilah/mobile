import 'package:flutter_application_kelas_d/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginsignController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  // Method to handle login
  void login() {
    if (username.isNotEmpty && password.isNotEmpty) {
      print("Logged in as: ${username.value}");
      Get.toNamed(AppRoutes.HOME_LOGGED_IN,
          arguments: username.value); // Navigate to logged-in home
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }

  // Method to handle sign-up
  void signUp() {
    if (username.isNotEmpty &&
        password.isNotEmpty &&
        password.value == confirmPassword.value) {
      print("Signed up as: ${username.value}");
      Get.toNamed(AppRoutes.HOME_LOGGED_IN,
          arguments:
              username.value); // Navigate to logged-in home after sign-up
    } else {
      Get.snackbar(
          "Error", "Please fill all fields and ensure passwords match");
    }
  }

  // Method for guest login
  void loginAsGuest() {
    print("Logged in as Guest");
    Get.toNamed(AppRoutes.HOME_GUEST); // Navigate to guest home
  }
}
