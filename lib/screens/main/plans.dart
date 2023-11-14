import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/plans/plans_container.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child: SingleChildScrollView(child: PlansContainer())));
  }
}
