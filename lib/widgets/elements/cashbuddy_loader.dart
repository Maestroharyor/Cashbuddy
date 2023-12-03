import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CashBuddyLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child; // Add this line

  const CashBuddyLoader(
      {super.key,
      required this.isLoading,
      required this.child}); // Update this line

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Content widgets underneath
        child, // Add this line

        // Loading overlay
        if (isLoading)
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height + 20,
            child: Container(
              color:
                  Colors.white.withOpacity(0.7), // Adjust the opacity as needed
              child: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Theme.of(context).primaryColor,
                  size: 70,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
