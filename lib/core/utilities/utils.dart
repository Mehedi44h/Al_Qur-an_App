// import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Utils {
//   static double getLat(String url) {
//     double lat;
//     lat = double.parse(url.split('@')[1].split(',')[0]);
//     return lat;
//   }
// // 
//   static double getLong(String url) {
//     double long;
//     long = double.parse(url.split('@')[1].split(',')[1]);
//     return long;
//   }

//   static Future<void> openMap(double latitude, double longitude) async {
//     String googleUrl =
//         'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude&zoom=14';
//     // String appleUrl = 'https://maps.apple.com/?ll=$latitude,$longitude&z=14';
//     // Uri aUri = Uri.parse(appleUrl);
//     Uri gUri = Uri.parse(googleUrl);
//     // if (Platform.isIOS) {
//     //   if (await canLaunchUrl(aUri)) {
//     //     await launchUrl(
//     //       aUri,
//     //       mode: LaunchMode.externalApplication,
//     //     );
//     //   } else {
//     //     showSnackbar(
//     //       msg: 'Could not open iOS Map Application',
//     //     );
//     //   }
//     // }
//     // if (Platform.isAndroid) {
//     if (await canLaunchUrl(gUri)) {
//       await launchUrl(
//         gUri,
//         mode: LaunchMode.externalApplication,
//       );
//     } else {
//       Get.snackbar(
//         'Error Occured!',
//         'Could not open Google Map Application',
//       );
//     }
//     // }
//   }

//   static StepperStep customStepDesign({
//     required String title,
//     Widget? leading,
//     String? imagePath,
//     required String description,
//   }) {
//     return StepperStep(
//       isExpanded: false,
//       title: Container(
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: Colors.blue.withOpacity(0.7),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//       leading: leading ??
//           Container(
//             width: 40,
//             height: 40,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           ),
//       view: Column(
//         children: [
//           if (imagePath != null)
//             Container(
//               height: 170,
//               width: Get.width,
//               margin: const EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           Container(
//             width: Get.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.grey.withOpacity(0.2),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   description,
//                   textAlign: TextAlign.justify,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
