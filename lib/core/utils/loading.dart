import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  double? size;
  CustomLoader({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: size ?? 30,
      width: size ?? 30,
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    ));
  }
}
