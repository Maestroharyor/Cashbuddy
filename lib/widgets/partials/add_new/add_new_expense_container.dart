import 'package:flutter/material.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:cashbuddy/data/index.dart';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:searchfield/searchfield.dart';

class AddNewExpenseContainer extends StatefulWidget {
  const AddNewExpenseContainer({super.key});

  @override
  State<AddNewExpenseContainer> createState() => _AddNewExpenseContainerState();
}

class _AddNewExpenseContainerState extends State<AddNewExpenseContainer> {
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
                    const Text('Add New Expense',
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
                      label: const Text("Name of Expense")),
                ),
                const SizedBox(
                  height: 30,
                ),
                SearchField(
                  // controller: selectedCategoryTitleController,
                  key: const Key('searchfield'),
                  hint: 'Search Budget Category Title',
                  itemHeight: 50,
                  scrollbarDecoration: ScrollbarDecoration(),
                  onTapOutside: (x) {},
                  searchInputDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Expense Category"),
                  emptyWidget: Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: const Text(
                        "Budget Category not found",
                        style: TextStyle(color: Colors.grey),
                      )),
                  suggestionsDecoration: SuggestionDecoration(
                    color: Colors.grey[100],
                  ),
                  suggestions: expenseCategories
                      .map((e) => SearchFieldListItem<String>(e,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 12),
                            child: Text(e,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor)),
                          )))
                      .toList(),
                ),
                // Positioned(
                //     right: 0,
                //     bottom: 13,
                //     child: Container(
                //       decoration: const BoxDecoration(color: Colors.white),
                //       child: Transform.rotate(
                //           angle: 20.4, child: const Icon(Icons.chevron_right)),
                //     )),
                TextDropdownFormField(
                  options: expenseCategories,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Expense Category"),
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
                      'Add Expense',
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
