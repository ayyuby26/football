import 'package:get/get.dart';

class TeamController extends GetxController {
  var hidePass = true.obs;
  change() {
    hidePass.value = !hidePass.value;
  }
}
