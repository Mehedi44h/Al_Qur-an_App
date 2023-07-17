import 'package:al_quran_mp3_offline/screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // color: Colors.blue,
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/splash.jpg',
              height: 870,
              width: double.infinity,
              fit: BoxFit.cover,
              // height: 500,
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Text(
          //   'Al Quran Mp3 Offline',
          //   style: TextStyle(
          //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
          // ),
        ],
      )),
    );
  }
}
