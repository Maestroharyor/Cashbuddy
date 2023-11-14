import 'package:flutter/material.dart';
import 'package:cashbuddy/models/all_models.dart';
import './plan_modal.dart';

class PrimaryPlanCard extends StatefulWidget {
  const PrimaryPlanCard({super.key});

  @override
  State<PrimaryPlanCard> createState() => _PrimaryPlanCardState();
}

class _PrimaryPlanCardState extends State<PrimaryPlanCard> {
  DisbursementPlan plan =
      DisbursementPlan(title: "Income Disbursement Plan", categories: [
    PlanCategory(title: "Fixed Costs", percentage: 30, color: Colors.grey[700]),
    PlanCategory(
        title: "Investments", percentage: 30, color: Colors.green[700]),
    PlanCategory(title: "Savings", percentage: 30, color: Colors.blue[700]),
    PlanCategory(title: "Debts", percentage: 30, color: Colors.purple[700]),
    PlanCategory(title: "Tithe", percentage: 30, color: Colors.blue[700]),
    PlanCategory(title: "Spending", percentage: 30, color: Colors.red[700]),
    PlanCategory(
        title: "Miscellaneous", percentage: 30, color: Colors.grey[700]),
  ]);

  // Create a global key for the form
  final _formKey = GlobalKey<FormState>();

  // Variables to store form data
  String? name = '';
  String? email = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    plan.title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        _openModal(context);
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: plan.categories
                    .map((category) => buildPlanCategory(category))
                    .toList(),
              )
            ]),
          ),
        ));
  }

  // Function to open the modal form
  void _openModal(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      context: context,
      isScrollControlled: true, // Ensures the modal takes up the full screen
      builder: (context) {
        return Container(
            // height: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const IncomePlanForm());
      },
    );
  }
}

Widget buildPlanCategory(PlanCategory category) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category.title,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: category.color,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          alignment: Alignment.center,
          child: Text(
            "${category.percentage.round()}%",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
