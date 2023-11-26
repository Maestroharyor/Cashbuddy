import 'dart:math';
import 'package:cashbuddy/data/index.dart';
import 'package:cashbuddy/models/all_models.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:searchfield/searchfield.dart';

class EditPlan extends StatefulWidget {
  final DisbursementPlan plan;
  const EditPlan({super.key, required this.plan});

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
  late DisbursementPlan plan;
  TextEditingController titleController = TextEditingController();

  final selectedCategoryTitleController = TextEditingController();

  TextEditingController selectedCategoryPercentageController =
      TextEditingController();
  List<String> nonSelectedCategories = budgetPlanCategories;
  List<PlanCategory> categories = [];
  PlanCategory? selectedCategory;
  double totalPercentage = 0;
  List<Color> colorList = _generateColorList(24);

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
        Colors.white,
      );
      return;
    }

    double remainingPercentage = 100 - totalPercentage;
    double enteredPercentage =
        double.tryParse(selectedCategoryPercentageController.text) ?? 0;
    if (selectedCategoryTitleController.text.isEmpty) {
      _showToast(
        'Category title cannot be empty',
        Colors.white,
      );
      return;
    }

    if (selectedCategoryPercentageController.text.isEmpty) {
      _showToast(
        'Category percentage cannot be empty',
        Colors.white,
      );
      return;
    }

    if (enteredPercentage == 0) {
      _showToast(
        'Category percentage cannot be zero',
        Colors.white,
      );
      return;
    }

    if (enteredPercentage > remainingPercentage) {
      _showToast(
        'Entered percentage exceeds available remaining percentage',
        Colors.white,
      );
      return;
    }

    setState(() {
      categories.add(
        PlanCategory(
          title: selectedCategoryTitleController.text,
          percentage: double.parse(selectedCategoryPercentageController.text),
          color: selectedCategory!.color,
        ),
      );

      totalPercentage += enteredPercentage;

      nonSelectedCategories = nonSelectedCategories
          .where((element) =>
              element != selectedCategoryTitleController.value.toString())
          .toList();

      currentColor = _generateRandomColor();
      selectedCategory =
          PlanCategory(title: "", percentage: 0, color: currentColor);

      selectedCategoryTitleController.text = selectedCategory!.title;
      selectedCategoryPercentageController.text =
          selectedCategory!.percentage.toString();
    });
  }

  void _removeCategory() {
    // setState(() {
    //   totalPercentage -= categories[index].percentage;

    //   nonSelectedCategories = [
    //     categories[index].title,
    //     ...nonSelectedCategories
    //   ];
    //   categories.removeAt(index);
    // });
    if (selectedCategory == null) {
      return;
    }
    setState(() {
      currentColor = _generateRandomColor();
      selectedCategory =
          PlanCategory(title: "", percentage: 0, color: currentColor);

      selectedCategoryTitleController.text = selectedCategory!.title;
      selectedCategoryPercentageController.text =
          selectedCategory!.percentage.toString();
    });
  }

  void _selectCategory(int index) {
    setState(() {
      if (selectedCategory != null &&
          selectedCategory!.title.isNotEmpty &&
          selectedCategory!.color.toString().isNotEmpty &&
          selectedCategory!.percentage.toString().isNotEmpty) {
        PlanCategory planToAdd = PlanCategory(
          title: selectedCategory!.title,
          percentage: selectedCategory!.percentage,
          color: selectedCategory!.color,
        );

        // Update the categories list by assigning the result of add to it
        // categories = List.from(categories)..add(planToAdd);
        if (categories.isEmpty) {
          categories = [planToAdd];
        } else {
          categories = List.from(categories)..add(planToAdd);
        }
      }
      totalPercentage -= categories[index].percentage;

      selectedCategory = categories[index];
      nonSelectedCategories = [
        categories[index].title,
        ...nonSelectedCategories
      ];

      selectedCategoryTitleController.text = categories[index].title;
      selectedCategoryPercentageController.text =
          categories[index].percentage.toString();

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
      animationDuration: const Duration(milliseconds: 300),
      context: context,
      title: message,
      autoCloseDuration: const Duration(seconds: 5),
      primaryColor: Theme.of(context).primaryColor,
      backgroundColor: backgroundColor,
      // foregroundColor: Colors.white,
      // style: ToastificationStyle.fillColored,
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

  double calculateTotalPercentage(List<PlanCategory> categories) {
    double totalPercentage = 0.0;

    for (PlanCategory category in categories) {
      totalPercentage += category.percentage;
    }

    return totalPercentage;
  }

  final suggestions = List.generate(10, (index) => 'suggestion $index');
  @override
  void initState() {
    super.initState();
    titleController.text = widget.plan.title;
    categories = widget.plan.categories;
    totalPercentage = calculateTotalPercentage(categories);
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
                      Text('Edit ${titleController.text}',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Plan Title',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      categories.isEmpty ? '' : 'Categories',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    if (categories.isNotEmpty)
                      const SizedBox(
                        height: 10,
                      ),
                    for (int i = 0; i < categories.length; i++)
                      _buildCategoryRow(i),
                    const SizedBox(height: 10),
                    if (totalPercentage < 100 ||
                        selectedCategoryTitleController.text != '')
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SearchField(
                                    controller: selectedCategoryTitleController,
                                    key: const Key('searchfield'),
                                    hint: 'Search Budget Category Title',
                                    itemHeight: 50,
                                    scrollbarDecoration: ScrollbarDecoration(),
                                    onTapOutside: (x) {},
                                    searchInputDecoration:
                                        const InputDecoration(
                                      labelText: 'Category Title',
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                    ),
                                    emptyWidget: Container(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            left: 10,
                                            right: 10),
                                        child: const Text(
                                          "Budget Category not found",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    suggestionsDecoration: SuggestionDecoration(
                                      color: Colors.grey[100],
                                    ),
                                    suggestions: nonSelectedCategories
                                        .map((e) => SearchFieldListItem<String>(
                                            e,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 12),
                                              child: Text(e,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            )))
                                        .toList(),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 60,
                                  child: TextField(
                                    controller:
                                        selectedCategoryPercentageController,
                                    maxLength: 3,
                                    buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      // Handle category percentage change if needed
                                    },
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
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
                                      color: selectedCategory!.color,
                                      // categories.isEmpty ? Colors.grey : categories.last.color,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                // IconButton(
                                //   icon: const Icon(Icons.add),
                                //   onPressed: _addCategory,
                                // ),
                                // IconButton(
                                //   icon: const Icon(Icons.remove),
                                //   onPressed: _removeCategory,
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                    ),
                                    onPressed: () {
                                      _addCategory();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    label: Text(
                                      'Add Category',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: ButtonStyle(
                                      // backgroundColor: MaterialStateProperty.all(
                                      //     Theme.of(context).primaryColor),

                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                      ),
                                    ),
                                    onPressed: () {
                                      _addCategory();
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                    label: Text(
                                      'Remove Category',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
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

                            _showToast("Plan Saved", Colors.white);
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
                )),
          )
        ]),
      ))),
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
          icon: const Icon(
            Icons.edit,
            color: Colors.grey,
          ),
          onPressed: () => _selectCategory(index),
        ),
      ],
    );
  }

  bool _validatePlan() {
    if (titleController.text.isEmpty) {
      _showToast(
        'Please enter a plan title',
        Colors.white,
      );
      return false;
    }

    if (totalPercentage != 100) {
      _showToast(
        'Total percentage must be 100',
        Colors.white,
      );
      return false;
    }

    return true;
  }
}
