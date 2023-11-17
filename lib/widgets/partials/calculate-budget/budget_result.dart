import 'package:cashbuddy/widgets/partials/calculate-budget/budget_result_card.dart';
import 'package:cashbuddy/widgets/partials/calculate-budget/budget_result_chart.dart';
import 'package:flutter/material.dart';

class BudgetResult extends StatelessWidget {
  const BudgetResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Budget Disbursement",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            BudgetResultCard(
                title: "Fixed Costs",
                amount: 200000,
                isPositive: false,
                percent: 30),
            BudgetResultCard(
                title: "Debts", amount: 200000, isPositive: false, percent: 30),
            BudgetResultCard(
                title: "Tithe", amount: 200000, isPositive: false, percent: 30),
            BudgetResultCard(
                title: "Spending",
                amount: 200000,
                isPositive: false,
                percent: 30),
            BudgetResultCard(
                title: "Investments",
                amount: 200000,
                isPositive: true,
                percent: 30),
            BudgetResultCard(
                title: "Savings",
                amount: 200000,
                isPositive: true,
                percent: 30),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        BudgetResultChart()
      ],
    );
  }
}
