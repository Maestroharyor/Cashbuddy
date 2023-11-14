import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/transactions/transactions_container.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child: SingleChildScrollView(
          child: TransactionsContainer(),
        )));
  }
}
