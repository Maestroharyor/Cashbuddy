import 'package:cashbuddy/routes/index.dart';
import 'package:flutter/material.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine the maximum width for each button
            double maxButtonWidth = constraints.maxWidth / 2;

            // Calculate the number of columns based on screen width
            int columns = (constraints.maxWidth < 500) ? 1 : 2;
            double aspectRatio = (constraints.maxWidth < 500) ? 2 : 6;
            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              childAspectRatio: aspectRatio,
              children: [
                ActionButton(
                    color: Colors.green[700]!,
                    backgroundColor: Colors.green[100]!.withAlpha(80),
                    maxWidth: maxButtonWidth,
                    icon: Icons.calculate_rounded,
                    label: 'Calculate Budget',
                    onPressed: () {
                      Navigator.pushNamed(context, calculateBudgetRoute);
                    }),
                // const SizedBox(width: 20),
                ActionButton(
                    color: Colors.blue[700]!,
                    backgroundColor: Colors.blue[100]!.withAlpha(80),
                    maxWidth: maxButtonWidth,
                    icon: Icons.add,
                    label: 'Add Budget Plan',
                    onPressed: () {
                      Navigator.pushNamed(context, addPlanRoute);
                    }),
                // ActionButton(
                //     color: Colors.green[700]!,
                //     backgroundColor: Colors.green[100]!.withAlpha(80),
                //     maxWidth: maxButtonWidth,
                //     icon: Icons.arrow_downward,
                //     label: 'Add Income',
                //     onPressed: () {}),
                // ActionButton(
                //     color: Colors.red[700]!,
                //     backgroundColor: Colors.red[100]!.withAlpha(80),
                //     maxWidth: maxButtonWidth,
                //     icon: Icons.arrow_upward,
                //     label: 'Add Expense',
                //     onPressed: () {}),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String label;
  final double maxWidth;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.label,
    required this.maxWidth,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: maxWidth * 2 < 400 ? const EdgeInsets.all(15) : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(4),
        ),
        child: maxWidth * 2 < 400
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Icon(icon, color: color, size: 30),
                    const SizedBox(width: 5),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(label, style: TextStyle(fontSize: 13, color: color))
                  ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Icon(icon, color: color, size: 30),
                    const SizedBox(width: 5),
                    Text(label, style: TextStyle(fontSize: 12, color: color))
                  ]),
      ),
    );
  }
}
