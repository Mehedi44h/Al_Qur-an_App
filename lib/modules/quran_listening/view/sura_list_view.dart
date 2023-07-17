import 'package:al_quran_mp3_offline/modules/quran_listening/service/suraService.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/view/sura_details.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/widget/audio_player.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/widget/sura_tile.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuraListView extends StatefulWidget {
  final String? languageCode;
  final String? title;
  final String? url;
  final bool? goDetails;

  const SuraListView({
    super.key,
    this.languageCode,
    this.title,
    this.url,
    this.goDetails,
  });

  @override
  State<SuraListView> createState() => _SuraListViewState();
}

class _SuraListViewState extends State<SuraListView> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    SuraService sura = SuraService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Surah List"
            // widget.title!
            ),
        centerTitle: true,
        // actions: const [ToHomeBtn()],
      ),
      body: BackgroundContainer(
        child: FutureBuilder(
            builder: (context, snapshot) => FutureBuilder(
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
                              onAudioTap: () {
                                Get.bottomSheet(
                                  SizedBox(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data![item].englishName
                                              .toString(),
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                        Text(
                                          snapshot.data![item].name.toString(),
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                        SizedBox(
                                          height: 150,
                                          child: CustomAudioPlayer(
                                              audioUrl: widget.url == null
                                                  ? 'https://server16.mp3quran.net/a_abdl/Rewayat-Hafs-A-n-Assem/${(item + 1).toString().padLeft(3, '0')}.mp3'
                                                  : '${widget.url}/${(item + 1).toString().padLeft(3, '0')}.mp3'),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Close',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              meaning:
                                  snapshot.data![item].englishNameTranslation,
                              subTitle: snapshot.data![item].name,
                              title: snapshot.data![item].englishName,
                              index: item + 1,
                              onTap: () {
                                if (widget.goDetails! == true) {
                                  Get.to(
                                    () => QuranListeningSurahDetails(
                                      surahNo: snapshot.data![item].number
                                          .toString(),
                                      surahName: snapshot
                                          .data![item].englishName
                                          .toString(),
                                      languageCode: widget.languageCode!,
                                    ),
                                  );
                                }
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
                      //!circular progress indicator
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
      ),
    );
  }
}
