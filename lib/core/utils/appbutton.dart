import 'package:flutter/material.dart';
import 'package:nasa_api/widgets/apptext.dart';
import 'package:nasa_api/widgets/decoration.dart';

class AppButton extends StatelessWidget {
  double? height;
  double? width;
  void Function()? function;
  Color? btnColor;
  String btnText;
  Color? txtColor;

  AppButton(
      {super.key,
      this.width,
      this.height,
      this.function,
      this.btnColor,
      required this.btnText,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function ?? () {},
        child: Container(
          height: height ?? 50,
          width: width ?? 200,
          decoration: customDecoration(
              color:btnColor?? Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: AppText(
              text: btnText,
              textColor: txtColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
