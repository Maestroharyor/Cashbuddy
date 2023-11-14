import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/add_new/add_new_container.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const SafeArea(
          child: SingleChildScrollView(child: AddNewContainer())),
    );
  }
}
