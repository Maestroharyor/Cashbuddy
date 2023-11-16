import 'package:flutter/material.dart';

class CalculateBudgetContainer extends StatefulWidget {
  const CalculateBudgetContainer({super.key});

  @override
  State<CalculateBudgetContainer> createState() =>
      _CalculateBudgetContainerState();
}

class _CalculateBudgetContainerState extends State<CalculateBudgetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
          decoration: BoxDecoration(color: Colors.blue[900]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: const Color.fromRGBO(255, 255, 255, 0.2),
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(5),
                      child: InkResponse(
                        child: IconButton.filled(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                          color: Colors.white,
                          iconSize: 27,
                          splashColor: Colors.blue[900],
                        ),
                      ),
                    ),
                    const Text('Calculate Budget',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 50),
                  ],
                ),
              ]),
        ),
      ]),
    );
  }
}
