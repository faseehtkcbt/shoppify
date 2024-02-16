import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  String? fontFamily;
  TextDecoration? textDecoration;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? textOverFlow;
  AppText(
      {super.key,
      required this.text,
      this.textDecoration,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textOverFlow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily ?? 'poppins',
        decoration: textDecoration ?? TextDecoration.none,
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        overflow: textOverFlow ?? TextOverflow.ellipsis,
      ),
    );
  }
}
