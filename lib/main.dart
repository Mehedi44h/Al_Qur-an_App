// import 'package:al_quran_mp3_offline/screens/home.dart';
import 'package:al_quran_mp3_offline/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 10));
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // centerTitle: true,

      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),

      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
