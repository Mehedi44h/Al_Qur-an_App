import 'package:get/get.dart';

class QuranController extends GetxController {
  RxDouble fontSize = 25.0.obs;

  Future<void> saveFontSize(double fontSize) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setDouble('fontSize', fontSize);
  }

  void getFontSize() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // fontSize.value = prefs.getDouble('fontSize') ?? 25.0;
  }

  void increaseFontSize() {
    if (fontSize < 40) {
      fontSize.value += 5.0;
      saveFontSize(fontSize.value);
    }
  }

  void decreaseFontSize() {
    if (fontSize > 25) {
      fontSize.value -= 5.0;
      saveFontSize(fontSize.value);
    }
  }

  @override
  void onInit() {
    getFontSize();
    super.onInit();
  }
}
