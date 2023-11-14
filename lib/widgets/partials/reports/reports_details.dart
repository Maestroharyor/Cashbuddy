import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/reports/outflow_item.dart';

class ReportDetails extends StatelessWidget {
  const ReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = Random().nextDouble();
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
    return Transform.translate(
      offset: const Offset(0, -40),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(200)),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Expenses",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          " ₦3,500",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "20% Percent decrease \nfrom last month",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12),
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!)
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 1,
                  //     blurRadius: 3,
                  //     offset: const Offset(0, 2),
                  //   )
                  // ]
                  ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(200)),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Income",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          " ₦3,500",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "20% Percent increase \nfrom last month",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12),
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Outflow Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "See where your money comes and go",
                    style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(children: [
                    OutflowItem(),
                    SizedBox(
                      width: 40,
                    ),
                    OutflowItem()
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(children: [
                    OutflowItem(),
                    SizedBox(
                      width: 40,
                    ),
                    OutflowItem()
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You have spent ₦3,500 \n this month",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        "Nov, 2023",
                        style: TextStyle(color: Colors.grey[100], fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LinearProgressIndicator(
                    semanticsLabel: "$progress%",
                    semanticsValue: progress.toString(),
                    minHeight: 10,
                    value: progress,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    backgroundColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        getProgressBarColor(progress)),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
