import 'package:flutter/material.dart';
import 'package:cashbuddy/screens/sub/add_new_expense.dart';
import 'package:cashbuddy/screens/sub/add_new_income.dart';

class AddNewContainer extends StatelessWidget {
  const AddNewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(children: [
        const Text(
          "Add New Expense/Income",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        Material(
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNewExpenseScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(30),
              // decoration: const BoxDecoration(
              //     // color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expense",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Add new expense to effectively track your spendings easily.",
                          softWrap: true,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Material(
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNewIncomeScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(30),
              // decoration: const BoxDecoration(
              //     // color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Income",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Add new income to effectively track your income easily.",
                          softWrap: true,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
