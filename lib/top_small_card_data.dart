import 'package:flutter/material.dart';
import 'constants.dart';

class TopSmallCardsData extends StatelessWidget {
  final String imagePath;
  final double? imageSize;
  final String text;

  TopSmallCardsData(
      {required this.imagePath, this.imageSize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(this.imagePath),
        SizedBox(
          height: 10.0,
        ),
        Text(
          this.text,
          style: headingsTextStyle,
        ),
      ],
    );
  }
}
