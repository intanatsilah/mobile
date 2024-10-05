import 'package:get/get.dart';

class HomeController extends GetxController {
  var cartItemCount = 0.obs;

  void addToCart() {
    cartItemCount++;
  }
}
