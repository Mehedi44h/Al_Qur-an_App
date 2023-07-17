// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:islamic_heart_softeners/screen/quran/sura_screen.dart';
// import 'package:islamic_heart_softeners/shared_preference/user_data_shared_pref.dart';
// import 'package:islamic_heart_softeners/widget/background_container.dart';
// import 'package:islamic_heart_softeners/widget/to_home_button.dart';

// class BookmarkScreen extends StatefulWidget {
//   const BookmarkScreen({super.key});

//   @override
//   State<BookmarkScreen> createState() => _BookmarkScreenState();
// }

// class _BookmarkScreenState extends State<BookmarkScreen> {
//   String bookmark = '';
//   @override
//   void initState() {
//     PrefService.init();
//     bookmark = PrefService.getBookmark() ?? '';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bookmark"),
//         centerTitle: true,
//         actions: const [ToHomeButton()],
//       ),
//       body: BackgroundContainer(
//         child: bookmark.isEmpty
//             ? const Center(
//                 child: Text(
//                   'No Bookmark',
//                 ),
//               )
//             : Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 100, bottom: 20),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: HexColor("#00e69d"),
//                         width: 7,
//                       ),
//                     ),
//                     child: const ClipOval(
//                       child: Icon(
//                         Icons.bookmark,
//                         size: 150,
//                         color: Colors.teal,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Text(
//                     'You were reading...',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: HexColor("#00e69d"),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   Text(
//                     'Sura Name: ${bookmark.split(':')[1]}',
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () => setState(() {
//                           PrefService.setBookmark('');
//                           bookmark = '';
//                         }),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                             Colors.red,
//                           ),
//                         ),
//                         child: const Text(
//                           'Clear Bookmark',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Get.to(
//                             () => SurahScreen(
//                               surahNo: bookmark.split(':')[0],
//                               surahName: bookmark.split(':')[1],
//                             ),
//                           )?.then((value) {
//                             String check = PrefService.getBookmark() ?? '';
//                             if (check.isEmpty) {
//                               setState(() {
//                                 bookmark = '';
//                               });
//                             }
//                           });
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                             Colors.blue,
//                           ),
//                         ),
//                         child: const Text(
//                           'Navigate me',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
