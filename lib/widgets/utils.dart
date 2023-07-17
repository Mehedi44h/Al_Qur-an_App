import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Methods {
  static void showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
    }
  }

  static void hideLoading() => EasyLoading.dismiss();

  static void showToast(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }
}
