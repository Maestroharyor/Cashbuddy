import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/add_new/add_new_expense_container.dart';

class AddNewExpenseScreen extends StatelessWidget {
  const AddNewExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child: SingleChildScrollView(child: AddNewExpenseContainer())));
  }
}
