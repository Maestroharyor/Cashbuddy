import 'package:cashbuddy/routes/index.dart';
import 'package:flutter/material.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(0, -60),
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ActionButtons(
              color: Colors.green,
              backgroundColor: Colors.green[100]!,
              icon: Icons.calculate_rounded,
              title: 'Calculate',
              onPressed: () {
                Navigator.pushNamed(context, calculateBudgetRoute);
              },
            ),
            SizedBox(
              width: 16,
            ),
            ActionButtons(
                color: Colors.blue,
                backgroundColor: Colors.blue[100]!,
                icon: Icons.add,
                title: 'Add Plan',
                onPressed: () {
                  Navigator.pushNamed(context, addPlanRoute);
                }),
            SizedBox(
              width: 16,
            ),
            ActionButtons(
                color: Colors.cyan,
                backgroundColor: Colors.cyan[100]!,
                icon: Icons.attach_money_rounded,
                title: 'Convert',
                onPressed: () {
                  //
                }),
          ]),
        ));

    //   Transform.translate(
    //     offset: const Offset(0, -50),
    //     child: Container(
    //       width: double.infinity,
    //       padding:
    //           const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    //       child: LayoutBuilder(
    //         builder: (context, constraints) {
    //           // Determine the maximum width for each button
    //           double maxButtonWidth = constraints.maxWidth / 2;

    //           // Calculate the number of columns based on screen width
    //           int columns = (constraints.maxWidth < 500) ? 1 : 2;
    //           double aspectRatio = (constraints.maxWidth < 500) ? 2 : 6;
    //           return GridView.count(
    //             physics: const NeverScrollableScrollPhysics(),
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 20.0,
    //             mainAxisSpacing: 20.0,
    //             shrinkWrap: true,
    //             childAspectRatio: aspectRatio,
    //             children: [
    //               ActionButton(
    //                   color: Colors.green[700]!,
    //                   backgroundColor: Colors.green[100]!.withAlpha(80),
    //                   maxWidth: maxButtonWidth,
    //                   icon: Icons.calculate_rounded,
    //                   label: 'Calculate Budget',
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, calculateBudgetRoute);
    //                   }),
    //               // const SizedBox(width: 20),
    //               ActionButton(
    //                   color: Colors.blue[700]!,
    //                   backgroundColor: Colors.blue[100]!.withAlpha(80),
    //                   maxWidth: maxButtonWidth,
    //                   icon: Icons.add,
    //                   label: 'Add Budget Plan',
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, addPlanRoute);
    //                   }),
    //               // ActionButton(
    //               //     color: Colors.green[700]!,
    //               //     backgroundColor: Colors.green[100]!.withAlpha(80),
    //               //     maxWidth: maxButtonWidth,
    //               //     icon: Icons.arrow_downward,
    //               //     label: 'Add Income',
    //               //     onPressed: () {}),
    //               // ActionButton(
    //               //     color: Colors.red[700]!,
    //               //     backgroundColor: Colors.red[100]!.withAlpha(80),
    //               //     maxWidth: maxButtonWidth,
    //               //     icon: Icons.arrow_upward,
    //               //     label: 'Add Expense',
    //               //     onPressed: () {}),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   );
  }
}

class ActionButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  ActionButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // borderRadius: BorderRadius.circular(1),
      // clipBehavior: Clip.hardEdge,
      color: backgroundColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: InkResponse(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
          child: Column(children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12),
            )
          ]),
        ),
      ),
    );
  }
}

// class ActionButton extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final Color backgroundColor;
//   final String label;
//   final double maxWidth;
//   final VoidCallback onPressed;

//   const ActionButton({
//     super.key,
//     required this.icon,
//     required this.color,
//     required this.backgroundColor,
//     required this.label,
//     required this.maxWidth,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         constraints: BoxConstraints(maxWidth: maxWidth),
//         padding: maxWidth * 2 < 400 ? const EdgeInsets.all(15) : const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(width: 1, color: color),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: maxWidth * 2 < 400
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                     Icon(icon, color: color, size: 30),
//                     const SizedBox(width: 5),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     Text(label, style: TextStyle(fontSize: 13, color: color))
//                   ])
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                     Icon(icon, color: color, size: 30),
//                     const SizedBox(width: 5),
//                     Text(label, style: TextStyle(fontSize: 12, color: color))
//                   ]),
//       ),
//     );
//   }
// }
