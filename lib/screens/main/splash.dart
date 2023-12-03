import 'package:cashbuddy/providers/auth_provider/auth.dart';
import 'package:cashbuddy/providers/auth_provider/provider.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/providers/user_provider/user.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  bool showOnboarding;
  SplashScreen({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(authUserProvider);
    final AsyncValue<AuthModel> auth = ref.watch(authProvider);
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
          const SizedBox(
            height: 20,
          ),
          // Text("Cash Buddy",
          //     style: TextStyle(color: Colors.white, fontSize: 30))
        ],
      ),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 1000),
      onEnd: () {
        print("End");
        if (showOnboarding) {
          Navigator.pushReplacementNamed(context, onboardingRoute);
        } else {
          print(auth.value!.isLoggedIn);
          print("Check end");
          if (auth.value!.isLoggedIn) {
            Navigator.pushReplacementNamed(context, authenticatedRoute);
          } else {
            Navigator.pushReplacementNamed(context, loginRoute);
          }
          // Navigator.pushReplacementNamed(context, authenticatedRoute);
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
