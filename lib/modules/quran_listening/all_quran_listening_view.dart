// import 'package:flutter/material.dart';
// import 'package:hajjapp/data/banner_writeups.dart';
// // import 'package:hajjapp/view/hajj/my_hajj_view/place_of_interest/famous_place.dart';
// import 'package:hajjapp/widget/background_container.dart';
// import 'package:hajjapp/widget/banner_writeup.dart';
// import 'package:hajjapp/widget/to_home_btn.dart';

// import '../../../core/menu_list.dart';
// import '../../../widget/menu_generate.dart';
// // import 'category_tile.dart';
// // import 'famous_place.dart';
// // import 'required_place.dart';

// class AllQuranListen extends StatefulWidget {
//   const AllQuranListen({super.key});

//   @override
//   State<AllQuranListen> createState() => _AllQuranListenState();
// }

// class _AllQuranListenState extends State<AllQuranListen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Qur'an Listening"),
//         centerTitle: true,
//         actions: const [
//           ToHomeBtn(),
//         ],
//       ),
//       body: BackgroundContainer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Image.asset(
//                     // ImageUrl.cHajjPoi,
//                     'assets/quran_main/banner/quran_listening.jpeg'),
//               ),
//               BannerWriteUp(
//                 title: WriteupData.wPlaceOfInterest,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//                     // CategoryTile(
//                     //   title: 'Some Heart Soothing Recitation',
//                     //   onTap: () {
//                     //     Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //         builder: (context) {
//                     //           return const SizedBox();
//                     //         },
//                     //       ),
//                     //     );
//                     //   },
//                     //   index: 1,
//                     // ),
//                     SizedBox(
//                       // height: Get.height - 200,
//                       child: MenuGenerator(
//                         menu: quran_listening,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
