import 'package:flutter/material.dart';
import 'package:nasa_api/widgets/decoration.dart';

class CustomImage extends StatelessWidget {
  EdgeInsets? padding;
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
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: customDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        color: Colors.white,
      ),
      padding: padding ??EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: Image.network(
          imageSrc,
          fit: boxFit,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.person,
              size: 30,
            );
          },
        ),
      ),
    );
  }
}
