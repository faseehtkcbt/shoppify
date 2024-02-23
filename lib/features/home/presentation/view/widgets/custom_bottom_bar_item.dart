import 'package:flutter/material.dart';

import '../../../../../widgets/apptext.dart';

class CustomBottomBarItem extends StatelessWidget {
  IconData icon;
  String label;
  bool selected;
  Function() onTap;
  CustomBottomBarItem(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.label,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: selected ? Colors.black : Colors.grey.shade700,
          ),
          AppText(
            text: label,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            textColor: selected ? Colors.black : Colors.grey.shade700,
          )
        ],
      ),
    );
  }
}
