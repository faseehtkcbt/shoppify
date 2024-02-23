import 'package:flutter/material.dart';

import 'apptext.dart';
import 'decoration.dart';

class AppTextIconButton extends StatelessWidget {
  double? height;
  double? width;
  void Function()? function;
  IconData? iconData;
  Color? btnColor;
  String btnText;
  Color? txtColor;
  AppTextIconButton(
      {super.key,
      this.width,
      this.height,
      this.function,
      this.btnColor,
      required this.btnText,
      required this.iconData,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function ?? () {},
        child: Container(
          height: height ?? 50,
          width: width ?? 100,
          decoration: customDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 20,
                  color: Colors.white,
                ),
                AppText(
                  text: btnText,
                  textColor: txtColor ?? Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ));
  }
}
