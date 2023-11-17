import 'dart:math';

import 'package:cashbuddy/utils/app_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BudgetResultChart extends StatelessWidget {
  const BudgetResultChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Budget Allocation Overview",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "₦${formatCurrency(1000000)}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "See how your spending would go",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1, // Adjust the thickness of the line
        ),
        const BudgetPieChart(),
        const SizedBox(
          height: 10,
        ),
        GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 14 / 2,
            shrinkWrap: true,
            children: const [
              IndicatorGrid(),
              IndicatorGrid(),
              IndicatorGrid(),
              IndicatorGrid(),
              IndicatorGrid(),
              IndicatorGrid(),
            ]) // IndicatorGrid()
      ],
    );
  }
}

class BudgetPieChart extends StatefulWidget {
  const BudgetPieChart({super.key});

  @override
  State<StatefulWidget> createState() => BudgetPieChartState();
}

class BudgetPieChartState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
                show: true, border: Border.all(color: Colors.white, width: 4)),
            sectionsSpace: 0,
            centerSpaceRadius: 10,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(6, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.amber,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 5:
          return PieChartSectionData(
            color: Colors.grey,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   shape: BoxShape.circle,
      //   border: Border.all(
      //     color: borderColor,
      //     width: 2,
      //   ),
      //   boxShadow: <BoxShadow>[
      //     BoxShadow(
      //       color: Colors.black.withOpacity(.5),
      //       offset: const Offset(3, 3),
      //       blurRadius: 3,
      //     ),
      //   ],
      // ),
      // padding: EdgeInsets.all(size * .15),
      // child: Center(
      // child: Text("Yeah"),
      // child: SvgPicture.asset(
      //   svgAsset,
      // ),
      // ),
    );
  }
}

class IndicatorGrid extends StatelessWidget {
  const IndicatorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(100)),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "Expenses",
          style: TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
