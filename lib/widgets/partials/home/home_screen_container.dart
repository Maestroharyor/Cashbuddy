import 'package:flutter/material.dart';
import 'package:cashbuddy/screens/sub/notifications.dart';
import 'package:cashbuddy/screens/sub/reports.dart';
import 'package:cashbuddy/utils/app_functions.dart';
import 'package:cashbuddy/widgets/partials/home/home_timeline.dart';

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({super.key});

  @override
  State<HomeScreenContainer> createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  int selectedMonth = 0;

  final months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  void setSelectedMonth(int index) {
    setState(() {
      selectedMonth = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 40, bottom: 100),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.blue[900]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello Maestro',
                          style:
                              TextStyle(color: Colors.blue[100], fontSize: 16)),
                      const SizedBox(height: 5),
                      Text('Good ${getTimeOfDay()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    clipBehavior: Clip.hardEdge,
                    child: InkResponse(
                      child: IconButton.filled(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsScreen()));
                        },
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                        highlightColor: Colors.white,
                        splashColor: Colors.blue[900],
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Transform.translate(
            offset: const Offset(0.0, -72.0),
            child: Container(
              height: 205,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.white, width: 2)),
              padding: const EdgeInsets.all(17),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("TOTAL SAVINGS",
                                  style: TextStyle(color: Colors.blue[100])),
                              const SizedBox(height: 5),
                              const Text(
                                "₦3,203,500.00",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        Material(
                          color: const Color.fromRGBO(255, 255, 255, 0.2),
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(100),
                          child: InkResponse(
                            child: IconButton.filled(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ReportsScreen()));
                              },
                              icon: const Icon(Icons.bar_chart),
                              color: Colors.white,
                              iconSize: 27,
                              splashColor: Colors.blue[900],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  padding: const EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      shape: BoxShape.circle),
                                  child: const Center(
                                      child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 17,
                                  )),
                                ),
                                const SizedBox(width: 9),
                                const Text("Income",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            const SizedBox(height: 9),
                            const Text(
                              "₦203,500.00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  padding: const EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      shape: BoxShape.circle),
                                  child: const Center(
                                      child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 17,
                                  )),
                                ),
                                const SizedBox(width: 9),
                                const Text("Expenses",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            const SizedBox(height: 9),
                            const Text(
                              "₦203,500.00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: months.asMap().entries.map((entry) {
                    int index = entry.key;
                    String month = entry.value;
                    return InkWell(
                      enableFeedback: true,
                      onTap: () {
                        setState(() {
                          selectedMonth = index;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            child: Text(
                              month,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 3,
                            decoration: BoxDecoration(
                              color: selectedMonth == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const HomeTimeline(),
        ],
      ),
    );
  }
}
