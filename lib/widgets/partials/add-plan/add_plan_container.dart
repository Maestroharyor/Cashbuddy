import 'package:flutter/material.dart';

class AddPlanContainer extends StatefulWidget {
  const AddPlanContainer({super.key});

  @override
  State<AddPlanContainer> createState() => _AddPlanContainerState();
}

class _AddPlanContainerState extends State<AddPlanContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.blue[900]),
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
                    const Text('Add Budget Plan',
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
