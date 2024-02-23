import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

TextStyle appTextStyle({
  String? fontFamily,
  TextDecoration? textDecoration,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  TextOverflow? textOverFlow,
}) {
  return TextStyle(
    fontFamily: fontFamily ?? AppConstants.poppinsFont,
    decoration: textDecoration ?? TextDecoration.none,
    color: textColor ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.w400,
    overflow: textOverFlow ?? TextOverflow.ellipsis,
  );
}
