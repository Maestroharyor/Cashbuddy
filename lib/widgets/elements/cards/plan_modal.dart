import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:cashbuddy/data/index.dart';
import 'dart:math';
import 'package:toastification/toastification.dart';
import 'package:cashbuddy/models/all_models.dart';

class IncomePlanForm extends StatefulWidget {
  const IncomePlanForm({super.key});

  @override
  _IncomePlanFormState createState() => _IncomePlanFormState();
}

class _IncomePlanFormState extends State<IncomePlanForm> {
  TextEditingController titleController = TextEditingController();
  DropdownEditingController<String>? categoryTitleController =
      DropdownEditingController<String>();
  TextEditingController categoryPercentageController = TextEditingController();
  List<String> nonSelectedCategories = incomeAndExpenseCategories;
  List<PlanCategory> categories = [];
  double totalPercentage = 0;
  List<Color> colorList = _generateColorList(64);

  static List<Color> _generateColorList(int count) {
    Random random = Random();
    List<Color> colors = [];
    for (int i = 0; i < count; i++) {
      colors.add(
        Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1.0,
        ),
      );
    }
    return colors;
  }

  Color currentColor = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1.0,
  );

  void _addCategory() {
    if (totalPercentage + 1 > 100) {
      _showToast(
        'Total percentage cannot exceed 100%',
        Theme.of(context).primaryColor,
      );
      return;
    }

    print(categoryTitleController?.value.toString());
    double remainingPercentage = 100 - totalPercentage;
    double enteredPercentage =
        double.tryParse(categoryPercentageController.text) ?? 0;
    if (categoryTitleController!.value.toString().isEmpty ||
        categoryTitleController!.value == null) {
      _showToast(
        'Category title cannot be empty',
        Theme.of(context).primaryColor,
      );
      return;
    }

    if (categoryPercentageController.text.isEmpty) {
      _showToast(
        'Category percentage cannot be empty',
        Theme.of(context).primaryColor,
      );
      return;
    }

    if (enteredPercentage > remainingPercentage) {
      _showToast(
        'Entered percentage exceeds available remaining percentage',
        Theme.of(context).primaryColor,
      );
      return;
    }

    setState(() {
      categories.add(
        PlanCategory(
          title: categoryTitleController!.value.toString(),
          percentage: enteredPercentage,
          color: currentColor,
        ),
      );
      totalPercentage += enteredPercentage;
      // categoryTitleController?.dispose();

      nonSelectedCategories = nonSelectedCategories
          .where(
              (element) => element != categoryTitleController!.value.toString())
          .toList();
      categoryTitleController = DropdownEditingController<String>();

      categoryPercentageController.clear();
      currentColor = _generateRandomColor();
    });
  }

  void _removeCategory(int index) {
    setState(() {
      totalPercentage -= categories[index].percentage;

      nonSelectedCategories = [
        categories[index].title,
        ...nonSelectedCategories
      ];
      categories.removeAt(index);
    });
  }

  void _pickColor(int index) {
    if (colorList.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color'),
            content: SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: colorList
                    .map(
                      (color) => GestureDetector(
                        onTap: () {
                          // currentColor = color;

                          Navigator.of(context).pop();
                          setState(() {
                            currentColor = color;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ).then((value) {
        // This ensures that the color change triggers a rebuild
        setState(() {});
      });
    } else {
      // Handle the case where the color list is empty
      print('Color list is empty');
    }
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  void _showToast(String message, Color backgroundColor) {
    toastification.show(
      context: context,
      title: message,
      autoCloseDuration: const Duration(seconds: 5),
      primaryColor: Colors.white,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      style: ToastificationStyle.fillColored,
    );
  }

  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          'Add Budget Plan',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Plan Title',
          ),
        ),
        const SizedBox(height: 20),
        Text(
          categories.isEmpty ? '' : 'Categories',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (categories.isNotEmpty)
          const SizedBox(
            height: 10,
          ),
        for (int i = 0; i < categories.length; i++) _buildCategoryRow(i),
        const SizedBox(height: 10),
        if (totalPercentage < 100)
          Row(
            children: [
              Expanded(
                child: TextDropdownFormField(
                  options: nonSelectedCategories,
                  controller: categoryTitleController,
                  decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Title"),
                  dropdownHeight: 300,
                ),
              ),
              // Expanded(
              //   child: TextField(
              //     controller: categoryTitleController,
              //     onChanged: (value) {
              //       // Handle category title change if needed
              //     },
              //     decoration: InputDecoration(
              //       labelText: 'Title',
              //     ),
              //   ),
              // ),
              const SizedBox(width: 10),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: categoryPercentageController,
                  maxLength: 3,
                  buildCounter: (context,
                      {required currentLength, required isFocused, maxLength}) {
                    return null;
                  },
                  onChanged: (value) {
                    // Handle category percentage change if needed
                  },
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Percent',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _pickColor(categories.length),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: currentColor,
                    // categories.isEmpty ? Colors.grey : categories.last.color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addCategory,
              ),
            ],
          ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(15),
              ),
            ),
            onPressed: () {
              if (_validatePlan()) {
                DisbursementPlan plan = DisbursementPlan(
                  title: titleController.text,
                  categories: categories,
                );
                // Add your logic to save the plan
                print(plan.title);
                print(plan.categories);
                _showToast("Plan Saved", Theme.of(context).primaryColor);
                Navigator.of(context).pop(plan);
              }
            },
            child: const Text(
              'Save Plan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryRow(int index) {
    return Row(
      children: [
        Expanded(
          child: Text(categories[index].title),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text("${categories[index].percentage.toString()}%"),
        ),
        const SizedBox(width: 10),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: categories[index].color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => _removeCategory(index),
        ),
      ],
    );
  }

  bool _validatePlan() {
    if (titleController.text.isEmpty) {
      _showToast(
        'Please enter a plan title',
        Theme.of(context).primaryColor,
      );
      return false;
    }

    if (totalPercentage != 100) {
      _showToast(
        'Total percentage must be 100',
        Theme.of(context).primaryColor,
      );
      return false;
    }

    return true;
  }
}
