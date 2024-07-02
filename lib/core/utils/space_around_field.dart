import 'package:flutter/material.dart';

class SpaceAroundField extends StatelessWidget {
  double? height;
  double? width;
  SpaceAroundField({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 10, width: width ?? 0);
  }
}
