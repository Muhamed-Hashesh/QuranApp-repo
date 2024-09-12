import 'package:get/get.dart';
import 'package:quran_project/themes/theme.dart';

/// change theme with GetX
class ChangeAppTheme extends GetxController {
  RxBool isDarkMode = false.obs;

  void changeTheme(value) {
    isDarkMode.value = value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }
}
