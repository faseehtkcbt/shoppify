import 'package:flutter/material.dart';

import '../../../../../widgets/apptext.dart';
import '../../../../../widgets/decoration.dart';
import '../../../data/products/modal/products.dart';

class StarIcon extends StatelessWidget {
  Rating? rating;
   StarIcon( {super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: EdgeInsets.all(2),
      decoration: customDecoration(
          color: Colors.yellow.shade600,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 15,
          ),
          AppText(
            text: rating!.rate.toString(),
            fontSize: 12,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
