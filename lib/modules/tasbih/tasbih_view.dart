import 'package:al_quran_mp3_offline/modules/tasbih/tasbih_screen.dart';
import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:al_quran_mp3_offline/widgets/category_tile.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hajjapp/view/salat/zikir_notification/zikir_notification.dart';

// import '../../widget/background_container.dart';
// import '../../widget/category_tile.dart';
// import '../../widget/custom_banner_widget.dart';
// import '../../widget/to_home_btn.dart';
// import 'package:islamic_heart_softeners/screen/tasbih/tasbih.dart';
// import 'package:islamic_heart_softeners/screen/zikir_notification/zikir_notification.dart';
// import 'package:islamic_heart_softeners/widget/background_container.dart';
// import 'package:islamic_heart_softeners/widget/category_tile.dart';
// import 'package:islamic_heart_softeners/widget/to_home_btn.dart';

// import '../../../../widget/background_container.dart';
// import '../../../../widget/category_tile.dart';
// import '../../../../widget/custom_banner_widget.dart';
// import '../../../../widget/to_home_btn.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TASBIH"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text('data'),
            //  ToHomeBtn(),
          ),
        ],
      ),
      body: BackgroundContainer(
          child: Column(
        children: [
          // SizedBox(
          //   height: 20.h,
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(),
            //  Image.asset(
            //   'assets/quran_main/banner/tasbih.jpeg',
            // ),
          ),
          // const BannerWidget(
          //   title:
          //       """And for men and women who engage much \nin Allah’s remembrance. For them has Allah prepared forgiveness and a great reward. (33:35)""",
          //   fontSize: 18,
          // ),
          CategoryTile(
              title: "Digital Counting",
              index: 1,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TasbihScreen()));
                // Get.to(() => const TasbihScreen());
              }),
          // CategoryTile(
          //   title: "Zikir Notification",
          //   index: 2,
          //   onTap: () => Get.to(
          //     () => const ZikirNotificationView(),
          //   ),
          // ),
        ],
      )),
    );
  }
}
