import 'package:flutter/material.dart';

BoxDecoration customDecoration(
    {Color? color,
    BorderRadius? borderRadius,
    DecorationImage? decorationImage,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
      color: color ?? Colors.black,
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      image: decorationImage,
      border: boxBorder);
}
