import 'package:al_quran_mp3_offline/modules/quran_listening/view/sura_list_view.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:hajjapp/view/all_quran_view/quran_listening/view/sura_list_view.dart';
// // import 'package:hajjapp/view/all_quran_view/quran_listening/view/sura_list_view.dart';

// import '../../../../../../data/banner_writeups.dart';
// import '../../../../../../widget/background_container.dart';
// import '../../../../../../widget/banner_writeup.dart';
// import 'package:hadith_app/feature/quran/view/sura_list_view.dart';
// import 'package:hadith_app/widget/background_container.dart';

class AllQuranListening extends StatelessWidget {
  const AllQuranListening({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recitationDescriptions = [
      {
        'name': 'Hani Ar Rifai',
        'url': 'https://server8.mp3quran.net/hani',
      },
      // {
      //   'name': 'Abdul Rahman Al-Sudais',
      //   'url': 'https://server11.mp3quran.net/sds',
      // },
      // {
      //   'name': 'Mahmoud Khalil Al-Hussary',
      //   'url': 'https://server13.mp3quran.net/husr',
      // },
      // {
      //   'name': 'Muhammad Siddiq Al Minshawi',
      //   'url': 'https://server10.mp3quran.net/minsh',
      // },
      // {
      //   'name': 'Muhammad Ayyub',
      //   'url': 'https://server8.mp3quran.net/ayyub',
      // },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listen Surahs'),
        centerTitle: true,
      ),
      body: BackgroundContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                // ImageUrl.cHajjPoi,
                'assets/splash.jpg',
                height: 100, width: 200,
              ),
            ),
            // BannerWriteUp(
            //   title: WriteupData.wPlaceOfInterest,
            // ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withAlpha(150),
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(
                        () => SuraListView(
                          title: recitationDescriptions[index]['name'],
                          url: recitationDescriptions[index]['url'],
                          goDetails: false,
                        ),
                      );
                    },
                    title: const Text(
                      // recitationDescriptions[index]['name'],
                      "Surah",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: recitationDescriptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
