import 'package:al_quran_mp3_offline/modules/quran_reading/all_quran_sura_list_screen.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:al_quran_mp3_offline/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hajjapp/view/all_quran_view/quran_reading/all_quran_sura_list_screen.dart';

// import '../../../data/banner_writeups.dart';
// import '../../../widget/background_container.dart';
// import '../../../widget/banner_writeup.dart';
// import '../../../widget/category_tile.dart';
// import '../../../widget/to_home_btn.dart';
// import 'package:islamic_heart_softeners/screen/quran/sura_list_screen.dart';
// import 'package:islamic_heart_softeners/widget/background_container.dart';
// import 'package:islamic_heart_softeners/widget/category_tile.dart';

// import '../../widget/to_home_btn.dart';

class AllQuranSurahType extends StatelessWidget {
  const AllQuranSurahType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("READING"),
        centerTitle: true,
        // actions: const [ToHomeBtn()],
      ),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 50),
              //   child: ClipOval(
              //     child: Image.asset(
              //       'assets/MenuIconBG-06.png',
              //       height: 130,
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(),
                // Image.asset(
                //   ImageUrl.cQuranReading,
                // ),
              ),
              // BannerWriteUp(
              //   title: WriteupData.wQuranR,
              // ),
              CategoryTile(
                title: 'Qur\'an in  Arabic',
                index: 1,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'arabic_mokhtasar',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Qur\'an in Arabic to English',
                index: 2,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'english_saheeh',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Qur\'an in Arabic to Bengali',
                index: 3,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'bengali_zakaria',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Qur\'an in Arabic to Hindi',
                index: 4,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'hindi_omari',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Qur\'an in Arabic to Urdu',
                index: 5,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'urdu_junagarhi',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Quran in Arabic to Malay',
                index: 6,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'malay_basumayyah',
                    ),
                  );
                },
              ),
              CategoryTile(
                title: 'Quran in Arabic to Indonesian',
                index: 7,
                onTap: () {
                  Get.to(
                    () => const AllQuranSurahList(
                      languageCode: 'indonesian_mokhtasar',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
