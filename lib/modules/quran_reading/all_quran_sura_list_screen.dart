import 'package:al_quran_mp3_offline/modules/quran_reading/all_quran_sura_screen.dart';
import 'package:al_quran_mp3_offline/services/surah_list.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:al_quran_mp3_offline/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../quran_listening/widget/sura_tile.dart';
// import 'package:hajjapp/view/all_quran_view/quran_reading/all_quran_sura_screen.dart';

// import '../../../data/user_info.dart';
// import '../../../data/user_shared-pref.dart';
// import '../../../widget/background_container.dart';
// import '../../../widget/custom_button.dart';
// import '../../../widget/to_home_btn.dart';
// import '../../my_quran/quran/services/surah_list.dart';
// import '../../my_quran/quran/widgets/sura_tile.dart';
// import 'package:islamic_heart_softeners/model/user_info.dart';
// import 'package:islamic_heart_softeners/screen/quran/sura_screen.dart';
// import 'package:islamic_heart_softeners/service/quran_service/surah_list.dart';
// import 'package:islamic_heart_softeners/shared_preference/user_data_shared_pref.dart';
// import 'package:islamic_heart_softeners/widget/background_container.dart';
// import 'package:islamic_heart_softeners/widget/custom_btn.dart';
// import 'package:islamic_heart_softeners/widget/sura_tile.dart';
// import 'package:islamic_heart_softeners/widget/to_home_btn.dart';

class AllQuranSurahList extends StatefulWidget {
  final String languageCode;
  const AllQuranSurahList({
    super.key,
    required this.languageCode,
  });

  @override
  State<AllQuranSurahList> createState() => _AllQuranSurahListState();
}

class _AllQuranSurahListState extends State<AllQuranSurahList> {
  bool _bySurah = true;
  // UserInfo? _usrInfo;
  String bookmark = '';

  @override
  void initState() {
    // PrefService.init();
    // _usrInfo = PrefService.getUser();
    // bookmark = PrefService.getBookmark() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bookmark = PrefService.getBookmark() ?? '';
    SurahListService sura = SurahListService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("SURAH LIST"),
        centerTitle: true,
        actions: const [
          // ToHomeBtn(),
        ],
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // RowBtns(
              //   btn1Text: 'By Surah',
              //   btn2Text: 'Bookmark',
              //   btn1Fn: () => setState(() => _bySurah = true),
              //   btn2Fn: () => setState(() => _bySurah = false),
              // ),
              Container(
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 26, 125, 164),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: CustomBtn(
                          onPressedFn: () => setState(() => _bySurah = true),
                          btnTxt: 'By Surah',
                          txtWeight: FontWeight.w600,
                          txtColor: _bySurah ? Colors.black : Colors.white,
                          btnColor: _bySurah
                              ? Colors.grey.shade200
                              : const Color.fromARGB(255, 5, 79, 108),
                          btnBorderColor: _bySurah
                              ? Colors.grey.shade200
                              : const Color.fromARGB(255, 5, 79, 108),
                          btnSize: const Size(double.infinity, 40),
                        ),
                      ),
                    ),
                    Container(
                      width: 3,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomBtn(
                          onPressedFn: () => setState(() => _bySurah = false),
                          btnTxt: 'Bookmark',
                          txtWeight: FontWeight.w600,
                          txtColor: !_bySurah ? Colors.black : Colors.white,
                          btnColor: !_bySurah
                              ? Colors.grey.shade200
                              : const Color.fromARGB(255, 5, 79, 108),
                          btnBorderColor: !_bySurah
                              ? Colors.grey.shade200
                              : const Color.fromARGB(255, 5, 79, 108),
                          btnSize: const Size(double.infinity, 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _bySurah
                  ? FutureBuilder(
                      future: sura.getSuraList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: sura.sura.length,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, item) {
                              if (snapshot.hasData) {
                                return SuraTile(
                                  onAudioTap: () {},
                                  meaning: snapshot
                                      .data![item].englishNameTranslation,
                                  subTitle: snapshot.data![item].name,
                                  title: snapshot.data![item].englishName,
                                  index: item + 1,
                                  onTap: () {
                                    // print(widget.languageCode);
                                    // return;
                                    Get.to(
                                      () => AllQuranSurahScreen(
                                        surahNo: snapshot.data![item].number
                                            .toString(),
                                        surahName: snapshot
                                            .data![item].englishName
                                            .toString(),
                                        languageCode: widget.languageCode,
                                      ),
                                    )!
                                        .then((value) {
                                      setState(() {
                                        if (value != null) {
                                          _bySurah = false;
                                        }
                                        // bookmark =
                                        //     PrefService.getBookmark() ?? '';
                                      });
                                    });
                                  },
                                );
                              } else {
                                const Text("No Data Available");
                              }
                              return null;
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Error loading data',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${snapshot.error}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.only(top: 330),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    )
                  : Column(
                      children: [
                        // SizedBox(
                        //   width: Get.width,
                        //   height: 35,
                        //   child: Row(
                        //     children: [
                        //       RowBtn(
                        //         title: 'Last Read',
                        //         isSelected: _lastReadFlag,
                        //         onTapFn: () => setState(
                        //           () => _lastReadFlag = true,
                        //         ),
                        //       ),
                        //       RowBtn(
                        //         title: 'My Favorites',
                        //         isSelected: !_lastReadFlag,
                        //         onTapFn: () => setState(
                        //           () => _lastReadFlag = false,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // _lastReadFlag
                        //     ? bookmark.isEmpty
                        //         ? const Padding(
                        //             padding: EdgeInsets.only(top: 280),
                        //             child: Text(
                        //               'Your last read will appear here.',
                        //               style: TextStyle(
                        //                 fontSize: 20,
                        //               ),
                        //             ),
                        //           )
                        //         :
                        //     Column(
                        //         children: [
                        //           const SizedBox(height: 40),
                        //           CustomBtn(
                        //             onPressedFn: () {
                        //               Get.to(
                        //                 () => SurahScreen(
                        //                   surahNo: bookmark.split(':')[0],
                        //                   surahName: bookmark.split(':')[1],
                        //                   scrollIndex:
                        //                       bookmark.split(':')[2],
                        //                 ),
                        //               )?.then((value) {
                        //                 String check =
                        //                     PrefService.getBookmark() ?? '';
                        //                 if (check.isEmpty) {
                        //                   setState(() {
                        //                     bookmark = '';
                        //                   });
                        //                 }
                        //               });
                        //             },
                        //             btnTxt: 'Take me to my last read',
                        //             txtSize: 20,
                        //             btnSize: Size(Get.width - 100, 55),
                        //             txtColor: const Color(0xFF024E7F),
                        //             btnColor: Colors.yellow.shade50,
                        //           ),
                        //           const SizedBox(height: 50),
                        //           Image.asset(
                        //             'assets/quran.png',
                        //           ),
                        //           const SizedBox(height: 20),
                        //           const Text(
                        //             'I was reading...',
                        //             style: TextStyle(
                        //               fontSize: 24,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.lightGreen,
                        //             ),
                        //           ),
                        //           const SizedBox(height: 10),
                        //           Text(
                        //             'Surah: ${bookmark.split(':')[1]}',
                        //             style: const TextStyle(
                        //               fontSize: 20,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           const SizedBox(height: 5),
                        //           Text(
                        //             'Ayah: ${int.parse(bookmark.split(':')[2]) + 1}',
                        //             style: const TextStyle(
                        //               fontSize: 20,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           const SizedBox(height: 40),
                        //           CustomBtn(
                        //             onPressedFn: () => setState(() {
                        //               PrefService.setBookmark('');
                        //               bookmark = '';
                        //             }),
                        //             btnTxt: 'Clear Bookmark',
                        //             btnSize: const Size(220, 55),
                        //             btnColor: Colors.red,
                        //             txtSize: 20,
                        //             btnBorderColor: Colors.red,
                        //           ),
                        //         ],
                        //       )
                        // :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Last Read',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  bookmark.isNotEmpty
                                      ? FavoriteItem(
                                          icon: Icons.bookmark_added_outlined,
                                          title:
                                              '${bookmark.split(':')[0]} - ${bookmark.split(':')[1]}',
                                          subtitle:
                                              'Ayah No: ${int.parse(bookmark.split(':')[2]) + 1}',
                                          deleteFn: () {
                                            setState(() {
                                              // PrefService.setBookmark('');
                                              bookmark = '';
                                            });
                                          },
                                          navigateFn: () {
                                            Get.to(
                                              () => AllQuranSurahScreen(
                                                surahNo: bookmark.split(':')[0],
                                                surahName:
                                                    bookmark.split(':')[1],
                                                scrollIndex:
                                                    bookmark.split(':')[2],
                                                languageCode:
                                                    widget.languageCode,
                                              ),
                                            )?.then((value) {
                                              // String check =
                                              // PrefService.getBookmark() ??
                                              //     '';
                                              // if (check.isEmpty) {
                                              //   setState(() {
                                              //     bookmark = '';
                                              //   });
                                              // }
                                            });
                                          },
                                        )
                                      : Center(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              'Your last read will appear here.',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                  const Text(
                                    'My Favorites',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder(
                              future: sura.getBookmarks(
                                uID: '1',
                              ),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.isEmpty) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 280),
                                      child: Center(
                                        child: Text(
                                          'No Favorite Added!',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return FavoriteItem(
                                          icon: Icons.favorite,
                                          title:
                                              '${snapshot.data![index].surahNo} - ${snapshot.data![index].surahName}',
                                          subtitle:
                                              'Ayah No: ${double.parse(snapshot.data![index].scrollOffset).toInt() + 1}',
                                          deleteFn: () async {
                                            bool resFlag =
                                                await sura.deleteBookmark(
                                              bID: snapshot.data![index].id,
                                            );
                                            if (resFlag) {
                                              setState(() {
                                                Get.snackbar(
                                                  'Delete Bookmark',
                                                  'Bookmark Deleted',
                                                );
                                              });
                                            }
                                          },
                                          navigateFn: () {
                                            Get.to(
                                              () => AllQuranSurahScreen(
                                                surahNo: snapshot
                                                    .data![index].surahNo,
                                                surahName: snapshot
                                                    .data![index].surahName,
                                                languageCode:
                                                    widget.languageCode,
                                                scrollIndex: double.parse(
                                                        snapshot.data![index]
                                                            .scrollOffset)
                                                    .toInt()
                                                    .toString(),
                                              ),
                                            )?.then((value) {
                                              setState(() {});
                                            });
                                          },
                                        );
                                      },
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      '${snapshot.error}',
                                    ),
                                  );
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.only(top: 280),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback deleteFn;
  final VoidCallback navigateFn;
  const FavoriteItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.deleteFn,
    required this.navigateFn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 70,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            //  Colors.teal.withAlpha(200),
            const Color.fromARGB(255, 5, 79, 108),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        title: Text(
          title,
        ),
        subtitle: Text(subtitle),
        trailing: SizedBox(
          width: 120,
          child: Row(
            children: [
              IconBtn(
                icon: Icons.delete,
                clr: const Color.fromARGB(255, 142, 67, 61),
                onTapFn: deleteFn,
              ),
              const SizedBox(width: 20),
              IconBtn(
                icon: Icons.arrow_forward_ios,
                clr: Colors.green,
                onTapFn: navigateFn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  final IconData icon;
  final Color clr;
  final VoidCallback onTapFn;
  const IconBtn({
    super.key,
    required this.icon,
    required this.clr,
    required this.onTapFn,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          clr,
        ),
      ),
      onPressed: onTapFn,
      icon: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class RowBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTapFn;
  final bool isSelected;
  const RowBtn({
    super.key,
    required this.title,
    required this.onTapFn,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapFn,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.teal,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.black : Colors.teal,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : null,
                fontWeight: isSelected ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
