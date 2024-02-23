import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String imageSrc;
  BorderRadius? borderRadius;
  BoxFit? boxFit;
  double? height;
  double? width;
  CustomImage({
    super.key,
    required this.imageSrc,
    this.boxFit,
    this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Image.network(
        imageSrc,
        fit: boxFit,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.person,
            size: 30,
          );
        },
      ),
    );
  }
}
