import 'package:cashbuddy/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  bool showOnboarding;
  SplashScreen({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          const Color.fromARGB(255, 6, 38, 86),
        ],
      ),
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: Image.asset("assets/icons/cashbuddy-bare.png"),
          ),
          SizedBox(
            height: 20,
          ),
          // Text("Cash Buddy",
          //     style: TextStyle(color: Colors.white, fontSize: 30))
        ],
      ),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () {
        print("End");
        if (showOnboarding) {
          Navigator.pushReplacementNamed(context, onboardingRoute);
        } else {
          Navigator.pushReplacementNamed(context, authenticatedRoute);
        }
      },
      // asyncNavigationCallback: () async {
      //   await Future.delayed(const Duration(seconds: 3));
      //   if (context.mounted) {
      //     // Navigator.pushReplacementNamed(context, "home");
      //     if (showOnboarding) {
      //       Navigator.pushReplacementNamed(context, onboardingRoute);
      //     } else {
      //       Navigator.pushReplacementNamed(context, authenticatedRoute);
      //     }
      //   }
      // },
      // nextScreen: const MyHomePage(),
    );
  }
}
