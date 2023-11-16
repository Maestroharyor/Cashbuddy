import 'package:flutter/material.dart';
import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/widgets/elements/cards/transaction_card.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

class TransactionsContainer extends StatefulWidget {
  const TransactionsContainer({super.key});

  @override
  State<TransactionsContainer> createState() => _TransactionsContainerState();
}

class _TransactionsContainerState extends State<TransactionsContainer> {
  @override
  String transactionType = "income";
  List<TransactionButtonData> buttonsData = [
    TransactionButtonData("All", Icons.compare_arrows_rounded, "all"),
    TransactionButtonData("Income", Icons.arrow_downward, "income"),
    TransactionButtonData("Expenses", Icons.arrow_upward, "expenses"),
  ];

  DateTime selectedDate = DateTime.now();
  final DateFormat? dateFormat =
      DateFormat('MMM, yyyy'); // Date format for displaying the selected date.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.blue[900]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Track Your Transactions',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buttonsData
                          .map((data) => buildTransactionButton(data))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dateFormat!.format(selectedDate),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        Transform.rotate(
                            angle: 77,
                            child: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 26,
                            ))
                      ]),
                )
              ]),
        ),
        Transform.translate(
          offset: const Offset(0, -50),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: Column(
              children: [
                TransactionCard(),
                TransactionCard(),
                TransactionCard(),
                TransactionCard(),
                TransactionCard(),
              ],
            ),
          ),
        )
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
