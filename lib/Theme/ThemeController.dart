import 'package:get/get.dart';
import 'themes.dart';

class ThemeController extends GetxController {
  // Observable to track theme mode
  var isDarkMode = false.obs;

  // Toggles between light and dark themes
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }
}
