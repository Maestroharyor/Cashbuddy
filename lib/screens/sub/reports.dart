import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/reports/reports_screen_container.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(child: ReportsScreenContainer())));
  }
}
