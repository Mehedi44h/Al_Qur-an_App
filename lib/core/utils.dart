// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// class Utils {
//   static void showSnackbar({
//     required String msg,
//     bool? isSuccess,
//     SnackPosition? position,
//     int? duration,
//   }) {
//     Get.snackbar(isSuccess != null ? 'Success' : 'Error Occurred!', msg,
//         icon: Icon(
//           isSuccess != null ? Icons.check_box_outlined : Icons.error,
//           // color: isSuccess != null ? Colors.green : Colors.red,
//           color: Colors.white,
//         ),
//         snackPosition: position ?? SnackPosition.TOP,
//         animationDuration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.only(bottom: 20),
//         duration: Duration(seconds: duration ?? 2),
//         backgroundColor: isSuccess != null ? Colors.green : Colors.red,
//         colorText: Colors.white,
//         dismissDirection: DismissDirection.horizontal);
//   }

//   static void showLoading() {
//     if (!EasyLoading.isShow) {
//       EasyLoading.show(
//         status: 'Loading...',
//         dismissOnTap: false,
//       );
//     }
//   }

//   static void hideLoading() => EasyLoading.dismiss();

//   static void showToast(String message) {
//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//         ),
//       ),
//     );
//   }

//   static int createUniqueID() {
//     return DateTime.now().millisecondsSinceEpoch.remainder(100000);
//   }
// }
