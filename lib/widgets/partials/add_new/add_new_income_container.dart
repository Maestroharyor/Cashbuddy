import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:cashbuddy/data/index.dart';
import 'package:intl/intl.dart';

class AddNewIncomeContainer extends StatefulWidget {
  const AddNewIncomeContainer({super.key});

  @override
  State<AddNewIncomeContainer> createState() => _AddNewIncomeContainerState();
}

class _AddNewIncomeContainerState extends State<AddNewIncomeContainer> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 120),
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
                    const Text('Add New Income',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 50),
                  ],
                ),
              ]),
        ),
        Transform.translate(
          offset: const Offset(0, -70),
          child: Container(
            padding:
                const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      border: const OutlineInputBorder(),
                      label: const Text("Income Name")),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextDropdownFormField(
                  options: incomeCategories,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Income Category"),
                  dropdownHeight: 250,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      border: const OutlineInputBorder(),
                      label: const Text("Amount")),
                  inputFormatters: [CurrencyTextInputFormatter(symbol: "₦")],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      border: const OutlineInputBorder(),
                      label: const Text("Select Date"),
                      suffixIcon: const Icon(Icons.calendar_today_rounded)),
                  controller: TextEditingController(
                    text:
                        selectedDate != null ? _formatDate(selectedDate!) : '',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(20),
                        )),
                    child: const Text(
                      'Add Income',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
