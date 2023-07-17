import 'package:al_quran_mp3_offline/core/imgUrl.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/service/suraService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../services/surah_list.dart';

class AllQuranSurahScreen extends StatefulWidget {
  AllQuranSurahScreen({
    super.key,
    required this.surahNo,
    required this.surahName,
    required this.languageCode,
    this.scrollIndex,
  });
  final String surahNo;
  final String surahName;
  final String languageCode;
  String? scrollIndex;

  @override
  State<AllQuranSurahScreen> createState() => _AllQuranSurahScreenState();
}

class _AllQuranSurahScreenState extends State<AllQuranSurahScreen> {
  final ItemScrollController _iScrollCon = ItemScrollController();
  // UserInfo? _usrInfo;
  int _lastIndex = -1;

  @override
  void initState() {
    // _usrInfo = PrefService.getUser();
    // getFontSize();
    super.initState();
  }

  // Future<void> saveFontSize(double fontSize) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setDouble('fontSize', fontSize);
  // }

  // void getFontSize() async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     // fontSize = prefs.getDouble('fontSize') ?? 25.0;
  //   });
  // }

  void increaseFontSize() {
    if (fontSize < 40) {
      setState(() {
        fontSize +=
            5.0; // Increase the font size by a certain amount (adjust as needed)
      });
      // saveFontSize(fontSize);
    }
  }

  void decreaseFontSize() {
    if (fontSize > 25) {
      setState(() {
        fontSize -=
            5.0; // Increase the font size by a certain amount (adjust as needed)
      });
      // saveFontSize(fontSize);
    }
  }

  double fontSize = 25.0;
  @override
  Widget build(BuildContext context) {
    SuraService service = SuraService();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surahName.toUpperCase(),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            //  => Get.to(() => const HomeView()),
            child: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          // InkWell(
          //   onTap: () => Get.back(
          //     result: true,
          //   ),
          //   child: const Icon(
          //     Icons.favorite_outline,
          //     size: 28,
          //   ),
          // ),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  color: const Color.fromARGB(255, 26, 125, 164),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Set Font Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                increaseFontSize();
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                decreaseFontSize();
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                // "assets/allpagebackgroundd.jpg",
                ImageUrl.allquranbg),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder(
          future: service.fetchSurah(
            languageCode: widget.languageCode,
            suraId: widget.surahNo,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ));
            } else {
              if (widget.scrollIndex != null) {
                if (widget.scrollIndex != null) {
                  _lastIndex = int.parse(widget.scrollIndex!);
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      _iScrollCon.scrollTo(
                        index: int.parse(widget.scrollIndex!),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  );
                }
              }
              return ScrollablePositionedList.builder(
                itemCount: snapshot.data!.result.length,
                itemScrollController: _iScrollCon,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black,
                            Color.fromARGB(255, 26, 125, 164),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "${snapshot.data!.result[index].arabicText}  (${snapshot.data!.result[index].aya})",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.amiri(
                                fontSize: fontSize,
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Divider(color: Colors.white),
                          if (widget.languageCode != 'arabic_mokhtasar')
                            Text(
                              snapshot.data!.result[index].translation,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.amiri(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          if (widget.languageCode != 'arabic_mokhtasar')
                            const Divider(color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // last read btn
                              AyahBtn(
                                icon: _lastIndex == index
                                    ? Icons.bookmark
                                    : Icons.bookmark_add_outlined,
                                text: _lastIndex == index
                                    ? 'Marked'
                                    : 'Last Read',
                                onTapFn: () => setState(() {
                                  if (_lastIndex != index) {
                                    _lastIndex = index;
                                    widget.scrollIndex = index.toString();
                                  } else {
                                    _lastIndex = -1;
                                  }
                                  // PrefService.setBookmark(
                                  //   '${widget.surahNo}:${widget.surahName}:$index',
                                  // );
                                  Get.snackbar(
                                    'Bookmark',
                                    'Added to Bookmarks',
                                  );
                                }),
                              ),
                              const SizedBox(width: 10),
                              // fav btn
                              // AyahBtn(
                              //   icon: Icons.favorite_border,
                              //   text: 'Favorite',
                              //   onTapFn: () async {
                              //     bool resFlag =
                              //         await SurahListService().addBookmark(
                              //       // uID: _usrInfo!.userId!,
                              //       surahNo: widget.surahNo,
                              //       surahName: widget.surahName,
                              //       scrollIndex: index,
                              //     );
                              //     if (resFlag) {
                              //       Get.snackbar(
                              //         'Favorite',
                              //         'Added to Favorites',
                              //       );
                              //     }
                              //   },
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class AyahBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTapFn;
  const AyahBtn({
    super.key,
    required this.icon,
    required this.text,
    required this.onTapFn,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
