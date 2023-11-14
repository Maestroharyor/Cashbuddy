import 'dart:math';

import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({super.key});

  @override
  final progress = Random().nextDouble();

  @override
  Widget build(BuildContext context) {
    Color getProgressBarColor(double progress) {
      if (progress >= 0.4 && progress < 0.7) {
        return Colors.yellow;
      } else if (progress >= 0.7) {
        return Colors.red;
      } else {
        return Colors.green; // Default color
      }
    }

    int percentage = (progress * 100).round();
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(Icons.create_new_folder_outlined)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transfer",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₦3,400",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: getProgressBarColor(progress)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "25, Nov 2023",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "$percentage% of budget plan",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  minHeight: 10,
                  value: progress,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  backgroundColor: Colors.grey[200],
                  color: Theme.of(context).primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      getProgressBarColor(progress)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
