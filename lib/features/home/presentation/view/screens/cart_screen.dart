import 'package:flutter/material.dart';

import '../../../../../widgets/apptext.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: "My Cart",
            fontSize: 30,
            fontWeight: FontWeight.w600,
            textOverFlow: TextOverflow.ellipsis),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
      body: SafeArea(child: Center()),
    );
  }
}
