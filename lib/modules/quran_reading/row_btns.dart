import 'package:al_quran_mp3_offline/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:islamic_heart_softeners/widget/custom_btn.dart';

class RowBtns extends StatefulWidget {
  final String btn1Text;
  final String btn2Text;
  final VoidCallback btn1Fn;
  final VoidCallback btn2Fn;
  bool? initialFlag;
  RowBtns({
    super.key,
    required this.btn1Text,
    required this.btn2Text,
    required this.btn1Fn,
    required this.btn2Fn,
    this.initialFlag,
  });

  @override
  State<RowBtns> createState() => _RowBtnsState();
}

class _RowBtnsState extends State<RowBtns> {
  bool _btn1Flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.teal.shade800,
        // borderRadius: const BorderRadius.vertical(
        //   bottom: Radius.circular(10),
        // ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: CustomBtn(
                onPressedFn: () => setState(() {
                  widget.btn1Fn();
                  _btn1Flag = true;
                }),
                btnTxt: widget.btn1Text,
                txtWeight: FontWeight.w600,
                txtColor: _btn1Flag ? Colors.black : Colors.white,
                btnColor: _btn1Flag ? Colors.grey.shade200 : Colors.teal,
                btnBorderColor: _btn1Flag ? Colors.grey.shade200 : Colors.teal,
                btnSize: const Size(double.infinity, 40),
              ),
            ),
          ),
          Container(
            width: 3,
            height: 50,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Expanded(
            child: Center(
              child: CustomBtn(
                onPressedFn: () => setState(() {
                  widget.btn2Fn();
                  _btn1Flag = false;
                }),
                btnTxt: widget.btn2Text,
                txtWeight: FontWeight.w600,
                txtColor: !_btn1Flag ? Colors.black : Colors.white,
                btnColor: !_btn1Flag ? Colors.grey.shade200 : Colors.teal,
                btnBorderColor: !_btn1Flag ? Colors.grey.shade200 : Colors.teal,
                btnSize: const Size(double.infinity, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
