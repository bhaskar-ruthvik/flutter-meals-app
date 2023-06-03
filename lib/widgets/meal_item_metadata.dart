import 'package:flutter/material.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({super.key, required this.icon, required this.detail});
  final IconData icon;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5,),
        Text(
          detail,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
