import 'package:cashbuddy/models/all_models.dart';
import 'package:flutter/material.dart';

class EditPlan extends StatefulWidget {
  final DisbursementPlan plan;
  const EditPlan({super.key, required this.plan});

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
  late DisbursementPlan plan;
  @override
  void initState() {
    super.initState();
    print(widget.plan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        // color: Colors.grey[100],
        child: Column(children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
            decoration: BoxDecoration(
                // borderRadius: const BorderRadius.only(
                //     bottomLeft: Radius.circular(10),
                //     bottomRight: Radius.circular(10)),
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
                      Text('Edit ${widget.plan.title}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 50),
                    ],
                  ),
                ]),
          ),
          Transform.translate(
            offset: const Offset(0, -40),
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 40),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: const Column()),
          )
        ]),
      ))),
    );
  }
}
