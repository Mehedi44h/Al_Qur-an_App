import 'package:al_quran_mp3_offline/widgets/background_container.dart';
import 'package:al_quran_mp3_offline/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hajjapp/core/imgUrl.dart';

// import '../../../../widget/background_container.dart';
// import '../../../../widget/custom_banner_widget.dart';
// import '../../../../widget/custom_text.dart';
// import 'package:islamic_heart_softeners/widget/background_container.dart';
// import 'package:islamic_heart_softeners/widget/custom_widget.dart';

// import '../../widget/custom_banner_widget.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final myController = TextEditingController();
  int counter = 1000000;
  int onClick = 0;
  int? inputValue = 0;
  String remark = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Digital Tasbih Counting"),
        centerTitle: true,
        elevation: 0,
      ),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BackgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(),
                  // Image.asset(
                  //   // ImageUrl.cHajjPoi,
                  //   'assets/img_click_btn.png',
                  // ),
                ),
                // const BannerWidget(
                //   title:
                //       'The Prophet replied, “Keep your tongue wet with the remembrance of Allah.” (At Tirmidhi)',
                // ),

                Text(
                  onClick.toString(),
                  style: TextStyle(fontSize: 100, color: HexColor("0000FF")),
                ),

                GestureDetector(
                  onTap: () {
                    if (counter == onClick) {
                      Get.snackbar(
                        "Congratulation",
                        "You have finished your targeted.\nReset Tasbih for start again",
                        backgroundColor:
                            const Color.fromARGB(255, 22, 169, 210),
                      );
                    } else {
                      setState(() {
                        onClick++;
                      });
                    }
                    HapticFeedback.heavyImpact();
                  },
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      // "assets/quran_main/img_click_btn.png",
                      "assets/quran_main/img_click_btn.png",
                      // ImageUrl.tasbiclick,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        scaffoldKey.currentState!.showBottomSheet((context) {
                          return Container(
                            color: const Color.fromARGB(255, 29, 126, 200),
                            // HexColor('#005044'),
                            height: 120,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    style: const TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    controller: myController,
                                    onChanged: (inputValue) {
                                      this.inputValue =
                                          int.tryParse(myController.text) ?? 0;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      counter = inputValue!;
                                      onClick = 0;
                                      remark = "";
                                      myController.clear();
                                      Navigator.pop(context);
                                    });
                                  },
                                  color:
                                      const Color.fromARGB(255, 23, 115, 213),
                                  // HexColor("#00a366"),
                                  child: const CustomText(
                                      txt: "Save", size: 15, bold: true),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 11, 147, 201),
                        side: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const CustomText(
                        txt: "Enter No of Counter",
                        size: 20,
                        bold: true,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            counter = 1000000;
                            onClick = 0;
                            remark = "";
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 19, 168, 218),
                          side: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: const CustomText(
                            txt: "Reset Tasbih", size: 20, bold: true)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
