import 'package:flutter_application_kelas_d/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_kelas_d/app/modules/home/views/home_guest_view.dart';
import 'package:flutter_application_kelas_d/app/modules/home/views/home_logged_in.dart';
import 'package:flutter_application_kelas_d/app/modules/loginsign/controllers/loginsign_controller.dart';
import 'package:flutter_application_kelas_d/app/modules/loginsign/views/login_view.dart';
import 'package:flutter_application_kelas_d/app/modules/loginsign/views/signup_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    // Login route
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginsignController());
      }),
    ),
    // Sign up route
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginsignController());
      }),
    ),
    // Home for logged-in users
    GetPage(
      name: AppRoutes.HOME_LOGGED_IN,
      page: () => HomeLoggedInView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    // Home for guest users
    GetPage(
      name: AppRoutes.HOME_GUEST,
      page: () => HomeGuestView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
  ];
}
