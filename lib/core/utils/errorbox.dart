import 'package:flutter/material.dart';

import '../main.dart';
import 'apptext.dart';

class ErrorBox extends StatefulWidget {
  String error;
  String btText;
  Function() function;
  ErrorBox(
      {super.key,
        required this.error,
        required this.function,
        required this.btText});

  @override
  State<ErrorBox> createState() => _ErrorBoxState();
}

class _ErrorBoxState extends State<ErrorBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.15,
          right: width * 0.15,
          top: height * 0.3,
          bottom: height * 0.3),
      child: Container(
          padding: EdgeInsets.only(
              left: width * 0.015,
              right: width * 0.015,
              top: height * 0.03,
              bottom: height * 0.03),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  height: height * 0.12,
                  child: AppText(text: widget.error,fontSize:  width * 0.04,textColor:  Colors.black,
                     fontWeight:  FontWeight.w500)),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                  onTap: widget.function,
                  child: Center(
                      child: AppText(text:widget.btText,fontSize:  width * 0.03,textColor:  Colors.red,
                          fontWeight: FontWeight.w500)))
            ],
          )
      ),
    );

  }
}
