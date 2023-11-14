import 'package:flutter/material.dart';
import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/widgets/elements/charts/reports/report_bar_chart.dart';
import 'package:cashbuddy/widgets/partials/reports/reports_details.dart';

class ReportsScreenContainer extends StatefulWidget {
  const ReportsScreenContainer({super.key});

  @override
  State<ReportsScreenContainer> createState() => _ReportsScreenContainerState();
}

class _ReportsScreenContainerState extends State<ReportsScreenContainer> {
  String transactionType = "income";
  List<TransactionButtonData> buttonsData = [
    // TransactionButtonData("All", Icons.compare_arrows_rounded, "all"),
    TransactionButtonData("Income", Icons.arrow_downward, "income"),
    TransactionButtonData("Expenses", Icons.arrow_upward, "expenses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Theme.of(context).primaryColor.withAlpha(30),
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(5),
                      child: InkResponse(
                        child: IconButton.filled(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                          color: Theme.of(context).primaryColor,
                          iconSize: 27,
                          splashColor: Colors.blue[900],
                        ),
                      ),
                    ),
                    Text('Reports',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(200)),
                      child: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("TOTAL SAVINGS",
                              style: TextStyle(color: Colors.blue[700])),
                          const SizedBox(height: 5),
                          const Text(
                            "₦3,203,500.00",
                            style: TextStyle(
                                fontSize: 26,
                                // color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buttonsData
                          .map((data) => buildTransactionButton(data))
                          .toList(),
                    ),
                  ),
                ),
              ]),
        ),
        Container(
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: const Column(
              children: [
                ReportsBarChart(),
              ],
            )),
        const ReportDetails(),
      ]),
    );
  }

  Widget buildTransactionButton(TransactionButtonData data) {
    return TextButton.icon(
      onPressed: () {
        setState(() {
          transactionType = data.type;
        });
      },
      icon: Transform.rotate(
          angle: data.type == "all" ? 55 : 0, child: Icon(data.icon)),
      label: Text(data.text),
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all<double>(16),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 14),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          transactionType == data.type
              ? Theme.of(context).primaryColor
              : Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          transactionType == data.type ? Colors.white : Colors.transparent,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
