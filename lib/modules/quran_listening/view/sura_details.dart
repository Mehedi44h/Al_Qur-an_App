import 'package:al_quran_mp3_offline/modules/quran_listening/controller/quran_controller.dart';
import 'package:al_quran_mp3_offline/modules/quran_reading/sura_service.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class QuranListeningSurahDetails extends StatelessWidget {
  final String surahNo;
  final String surahName;
  final String languageCode;

  const QuranListeningSurahDetails({
    super.key,
    required this.surahNo,
    required this.surahName,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    SuraService api = SuraService();
    QuranController controller = Get.put(QuranController());
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(10),
                  color: HexColor('#00baba'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          'Font Size: ${controller.fontSize.value}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black.withAlpha(150),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black.withAlpha(150),
                              child: IconButton(
                                onPressed: () {
                                  controller.increaseFontSize();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black.withAlpha(150),
                              child: IconButton(
                                onPressed: () {
                                  controller.decreaseFontSize();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
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
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlassPlus),
          ),
          // const ToHomeBtn()
        ],
      ),
      body: BackgroundContainer(
        child: FutureBuilder(
          future: api.fetchSurah(languageCode: languageCode, suraId: surahNo),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.result.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(150),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              snapshot.data!.result[index].arabicText,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: "Amiri",
                                fontSize: controller.fontSize.value,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data!.result[index].translation
                                .replaceAll(RegExp(r'\(\d+\)\s*'), '')
                                .trim(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: "Amiri",
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white.withAlpha(90),
                                child: Text(
                                  snapshot.data!.result[index].aya,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontFamily: "Amiri",
                                    fontSize: 15,
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showFooterDialog(
                                      snapshot.data!.result[index].footnotes);
                                },
                                child: const Text(
                                  'Annotation',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
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
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void showFooterDialog(String footer) {
    Get.dialog(
      AlertDialog(
        content: Text(
          footer,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
