import 'package:cashbuddy/utils/app_functions.dart';
import 'package:flutter/material.dart';

class BudgetResultCard extends StatelessWidget {
  final String title;
  final int percent;
  final int amount;
  final bool isPositive;
  const BudgetResultCard(
      {super.key,
      required this.title,
      required this.percent,
      required this.amount,
      required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.white.withAlpha(60)))),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  isPositive ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 18,
                  color: isPositive ? Colors.green[800] : Colors.red[800],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$percent% of your budget",
                    style: TextStyle(color: Colors.grey[100], fontSize: 13),
                  )
                ],
              ),
            ],
          ),
          Text(
            "₦${formatCurrency(amount)}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
