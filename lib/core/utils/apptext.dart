import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextOverflow textOverflow;
  final TextStyle? textStyle;
  final int maxLines;
  final TextDecoration? textDecoration;
  const AppText(
      {super.key,
      required this.text,
      required this.textStyle,
      this.textSize,
      this.fontWeight,
      this.textColor,
      this.textOverflow = TextOverflow.ellipsis,
      this.textDecoration,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLines,
      style: textStyle?.copyWith(
          fontFamily: 'Poppins',
          color: textColor,
          fontWeight: fontWeight,
          fontSize: textSize,
          decoration: textDecoration),
    );
  }
}
