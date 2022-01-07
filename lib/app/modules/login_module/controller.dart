import 'package:get/get.dart';

class LoginController extends GetxController {
  var hidePass = true.obs;
  change() {
    hidePass.value = !hidePass.value;
  }
}
