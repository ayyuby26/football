import 'package:get/get.dart';

class RegisterController extends GetxController {
  var hidePass = true.obs;
  change() {
    hidePass.value = !hidePass.value;
  }
}
