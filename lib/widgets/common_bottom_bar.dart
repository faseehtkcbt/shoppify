import 'package:flutter/material.dart';

import '../main.dart';
import 'decoration.dart';

class CommonBottomBar extends StatelessWidget {
  EdgeInsets? edgeInsets;
  double? height;
  Widget? widget;
  CommonBottomBar(
      {super.key, this.edgeInsets, required this.widget, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsets ?? const EdgeInsets.all(10),
      decoration: customDecoration(color: Colors.white),
      width: width,
      height: height ?? 75,
      child: widget,
    );
  }
}
