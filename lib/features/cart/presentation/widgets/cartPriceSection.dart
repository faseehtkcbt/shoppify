import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../../../../widgets/apptext.dart';
import '../../../../widgets/space_around_field.dart';

class CartPriceSection extends StatelessWidget {
  const CartPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20, left: 10, right: 10),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'SubTotal',
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey.shade500,
                  fontSize: 15,
                ),
                AppText(
                  text: '${AppConstants.rupeeSymbol} 1000',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black,
                  fontSize: 15,
                )
              ]),
          SpaceAroundField(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'VAT(%)',
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey.shade500,
                  fontSize: 15,
                ),
                AppText(
                  text: '${AppConstants.rupeeSymbol} 0.00',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black,
                  fontSize: 15,
                )
              ]), SpaceAroundField(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Shipping Fee',
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey.shade500,
                  fontSize: 15,
                ),
                AppText(
                  text: '${AppConstants.rupeeSymbol} 1000',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black,
                  fontSize: 15,
                )
              ]),
          SpaceAroundField(
            height: 10,
          ),
          Divider(
            height: 3,
            color: Colors.grey.shade600,
          ),SpaceAroundField(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Total',
                  fontWeight: FontWeight.w500,
                  textColor: Colors.black,
                  fontSize: 15,
                ),
                AppText(
                  text: '${AppConstants.rupeeSymbol} 1000',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black,
                  fontSize: 15,
                )
              ]),
        ]),
      ),
    );
  }
}
