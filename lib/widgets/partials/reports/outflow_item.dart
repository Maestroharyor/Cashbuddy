import 'package:flutter/material.dart';

class OutflowItem extends StatelessWidget {
  const OutflowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.red[700], borderRadius: BorderRadius.circular(200)),
        child: const Icon(
          Icons.fastfood_rounded,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Food and Drink",
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "₦2,340",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      )
    ]);
  }
}
