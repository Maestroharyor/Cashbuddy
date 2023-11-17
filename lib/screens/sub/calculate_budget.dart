import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/calculate-budget/calculate_budget_container.dart';

class CalculateBudget extends StatefulWidget {
  const CalculateBudget({super.key});

  @override
  State<CalculateBudget> createState() => _CalculateBudgetState();
}

class _CalculateBudgetState extends State<CalculateBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const SafeArea(
          child: SingleChildScrollView(child: CalculateBudgetContainer())),
    );
  }
}
