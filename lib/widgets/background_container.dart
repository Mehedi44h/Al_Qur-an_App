import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  String? imgUrl;
  BackgroundContainer({
    super.key,
    required this.child,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(100),
        // image: DecorationImage(
        //   image: AssetImage(
        //     imgUrl ?? ImageUrl.backgroundImage,
        //   ),
        //   fit: BoxFit.fill,
        // ),
      ),
      child: child,
    );
  }
}
