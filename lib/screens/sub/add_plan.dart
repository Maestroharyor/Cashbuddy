import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/add-plan/add_plan_container.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({super.key});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SingleChildScrollView(child: AddPlanContainer())),
    );
  }
}
