import 'package:cashbuddy/widgets/partials/calculate-budget/budget_result.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class CalculateBudgetContainer extends StatefulWidget {
  const CalculateBudgetContainer({super.key});

  @override
  State<CalculateBudgetContainer> createState() =>
      _CalculateBudgetContainerState();
}

class _CalculateBudgetContainerState extends State<CalculateBudgetContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 80),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello, Maestro",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Calculate your Budget based on your budget plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      label: Text(
                        "Enter Amount",
                        style: TextStyle(color: Colors.white),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    inputFormatters: [CurrencyTextInputFormatter(symbol: "₦")],
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchField(
                    // controller: selectedCategoryTitleController,
                    key: const Key('searchfield'),
                    // hint: 'Search Budget Plan',
                    itemHeight: 50,
                    scrollbarDecoration: ScrollbarDecoration(),
                    onTapOutside: (x) {},
                    searchStyle: const TextStyle(color: Colors.white),
                    searchInputDecoration: const InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      label: Text(
                        "Select Budget Plan",
                        style: TextStyle(color: Colors.white),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ),
                    suggestionsDecoration: SuggestionDecoration(
                      color: Colors.grey[100],
                    ),
                    suggestions: []
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
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          )),
                      child: Text(
                        'Calculate Budget',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const BudgetResult()
                ],
              )
            ]),
      ),
    ]);
  }
}
