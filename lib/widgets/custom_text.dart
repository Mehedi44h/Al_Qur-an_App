import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? txt;
  final double? size;
  final bool? bold;
  const CustomText(
      {super.key, required this.txt, required this.size, required this.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      style: TextStyle(
          fontSize: size,
          fontWeight: bold! ? FontWeight.bold : FontWeight.w300),
    );
    //  AutoSizeText(
    //   txt!,
    //   // maxFontSize: 20,
    //   // minFontSize: 12,
    //   wrapWords: false,
    //   stepGranularity: 4.0,
    //   style: TextStyle(
    //       fontSize: size,
    //       fontWeight: bold! ? FontWeight.bold : FontWeight.w300,
    //       color: Colors.white),
    // );
  }
}
