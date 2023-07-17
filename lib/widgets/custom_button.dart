import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String btnTxt;
  double? txtSize;
  double? btnBorderRadius;
  FontWeight? txtWeight;
  Size? btnSize;
  Color? btnColor;
  Color? txtColor;
  Color? btnBorderColor;
  String? btnIcon;
  bool? radiusTop;
  CustomBtn({
    Key? key,
    required this.onPressedFn,
    required this.btnTxt,
    this.txtSize,
    this.txtWeight,
    this.btnSize,
    this.btnBorderRadius,
    this.btnColor,
    this.txtColor,
    this.btnBorderColor,
    this.btnIcon,
    this.radiusTop,
    EdgeInsets? cPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFn,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          btnSize ?? const Size(388, 56),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          btnColor ?? Colors.green,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: radiusTop != null
                ? BorderRadius.vertical(
                    top: Radius.circular(btnBorderRadius ?? 8),
                  )
                : BorderRadius.circular(btnBorderRadius ?? 8),
            side: BorderSide(
              color: btnBorderColor ?? Colors.green,
              width: 1.0,
            ),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (btnIcon != null)
          //   SvgPicture.asset(
          //     'assets/svgs/${btnIcon!}.svg',
          //     fit: BoxFit.fill,
          //   ),
          // if (btnIcon != null) addW(5.w),
          Text(
            btnTxt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: txtColor ?? Colors.white,
              fontSize: txtSize ?? 15,
              fontWeight: txtWeight ?? FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
