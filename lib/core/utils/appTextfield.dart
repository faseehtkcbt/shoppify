import 'package:flutter/material.dart';
import 'package:nasa_api/widgets/appTextStyle.dart';

class AppTextField extends StatelessWidget {
  TextEditingController textEditingController;
  TextInputType? textInputType;
  void Function(String)? onChanged;
  double? textFieldWidth;
  String? hintText;
  Widget? prefixIcon;
  AppTextField(
      {super.key,
      required this.textEditingController,
      this.textInputType,
      this.hintText,
      this.prefixIcon,
      this.onChanged,
      this.textFieldWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: textFieldWidth ?? 300,
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: appTextStyle(
              textColor: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          keyboardType: textInputType ?? TextInputType.text,
          onChanged: onChanged ?? (value) {},
          decoration: InputDecoration(
              hintText: hintText ?? "",
              prefixIcon: prefixIcon,
              hintStyle: appTextStyle(
                  textColor: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black))),
        ),
      ),
    );
  }
}
