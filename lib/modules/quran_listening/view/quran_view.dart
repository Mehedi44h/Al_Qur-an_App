import 'package:al_quran_mp3_offline/modules/quran_listening/view/sura_list_view.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/widget/quran_tile.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hajjapp/view/all_quran_view/quran_listening/view/sura_list_view.dart';
// import 'package:hajjapp/view/all_quran_view/quran_listening/widget/quran_tile.dart';

// import '../../../../../../widget/background_container.dart';
// import '../../../../../../widget/custom_banner_widget.dart';
// import '../../../../../../widget/to_home_btn.dart';
// import 'package:hadith_app/feature/quran/widget/quran_tile.dart';
// import 'package:hadith_app/widget/background_container.dart';
// import 'package:hadith_app/widget/banner_widget.dart';

// import '../../../old/to_home_btn.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> suraList = [
      {
        'name': 'Qur\'an in Arabic to Arabic',
        'languageCode': 'arabic_mokhtasar',
      },
      {
        'name': 'Qur\'an in Arabic to English',
        'languageCode': 'english_saheeh',
      },
      {
        'name': 'Qur\'an in Arabic to Bengali',
        'languageCode': 'bengali_zakaria',
      },
      {
        'name': 'Qur\'an in Arabic to Hindi',
        'languageCode': 'hindi_omari',
      },
      {
        'name': 'Qur\'an in Arabic to Urdu',
        'languageCode': 'urdu_junagarhi',
      },
      {
        'name': 'Qur\'an in Arabic to Malay',
        'languageCode': 'malay_basumayyah',
      },
      {
        'name': 'Qur\'an in Arabic to Indonesian',
        'languageCode': 'indonesian_mokhtasar',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qur\'an'),
        // actions: const [ToHomeBtn()],
      ),
      body: BackgroundContainer(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            // const BannerWidget(
            //   title:
            //       """The Messenger of Allah (blessings of Allah be upon him and his family) has said: “The best of those amongst you is the one who learns the Qur’an and then teaches it to others.”""",
            //   fontSize: 16,
            // ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => QuranTile(
                title: suraList.elementAt(index)['name'].toString(),
                onTap: () {
                  Get.to(
                    () => SuraListView(
                      goDetails: true,
                      languageCode:
                          suraList.elementAt(index)['languageCode'].toString(),
                      title: suraList.elementAt(index)['name'].toString(),
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: suraList.length,
            )
          ],
        ),
      ),
    );
  }
}
