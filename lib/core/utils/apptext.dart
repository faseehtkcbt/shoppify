import 'package:flutter/material.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/widgets/appTextStyle.dart';

class AppText extends StatelessWidget {
  String text;
  String? fontFamily;
  TextDecoration? textDecoration;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? textOverFlow;
  int? maxLines;
  AppText(
      {super.key,
      required this.text,
      this.textDecoration,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textOverFlow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      style: appTextStyle(
          fontWeight: fontWeight,
          textOverFlow: textOverFlow,
          fontFamily: fontFamily,
          fontSize: fontSize,
          textColor: textColor,
          textDecoration: textDecoration),
    );
  }
}
