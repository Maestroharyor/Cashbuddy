import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/elements/charts/reports/bar_chart_data.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

class ReportsBarChart extends StatefulWidget {
  const ReportsBarChart({super.key});

  @override
  State<ReportsBarChart> createState() => _ReportsBarChartState();
}

class _ReportsBarChartState extends State<ReportsBarChart> {
  String selectedDateMode = "Weekly";
  List<String> dateModes = ["Weekly", "Monthly"];
  DateTime selectedDate = DateTime.now();
  final DateFormat? dateFormat =
      DateFormat('MMM, yyyy'); // Date format for displaying the selected date.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<Widget> _buildWidgetList() {
    return dateModes
        .map(
          (item) => SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedDateMode = item;
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      item == selectedDateMode
                          ? Theme.of(context).primaryColor
                          : Colors.grey[100]),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16))),
              child: Text(
                item,
                style: TextStyle(
                  color: item == selectedDateMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  _openDateModeSelector() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Date Mode'),
          content: SizedBox(
            height: 120,
            child: Column(
              children: _buildWidgetList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          bottom: 80,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _openDateModeSelector();
                    },
                    child: Row(children: [
                      Text(
                        selectedDateMode,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Transform.rotate(
                          angle: 81.7,
                          child: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white,
                            size: 17,
                          ))
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Row(children: [
                        Text(
                          dateFormat!.format(selectedDate),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
                        ),
                        Transform.rotate(
                            angle: 77,
                            child: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).primaryColor,
                              size: 26,
                            ))
                      ]),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const DataBarChart()
          ],
        ));
  }
}
