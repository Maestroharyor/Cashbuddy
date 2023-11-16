import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/elements/cards/primary_plan_card.dart';

class PlansContainer extends StatefulWidget {
  const PlansContainer({super.key});

  @override
  State<PlansContainer> createState() => _PlansContainerState();
}

class _PlansContainerState extends State<PlansContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.blue[900]),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Plans',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                  ],
                ),
              ]),
        ),
        Transform.translate(
          offset: const Offset(0, -30),
          child: Container(
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: const PrimaryPlanCard()),
        ),
      ]),
    );
  }
}
