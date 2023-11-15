import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:cashbuddy/routes/index.dart';

class OnboardingScreen extends StatelessWidget {
  final VoidCallback setOnboardingViewed;
  // final VoidCallback onLoginPressed;
  // final VoidCallback onRegisterPressed;
  const OnboardingScreen({
    super.key,
    required this.setOnboardingViewed,
    // required this.onLoginPressed,
    // required this.onRegisterPressed
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        controllerColor: Theme.of(context).primaryColor,
        pageBackgroundColor: Colors.white,
        indicatorPosition: 20,
        centerBackground: true,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        trailingFunction: () {
          setOnboardingViewed();
          Navigator.pushReplacementNamed(context, loginRoute);
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onFinish: () {
          setOnboardingViewed();
          Navigator.pushReplacementNamed(context, registerRoute);
        },
        skipTextButton: Text(
          'Skip',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        background: [
          Image.asset(
            'assets/images/onboarding_image_1.png',
            // height: 500,
          ),
          Image.asset(
            'assets/images/onboarding_image_2.png',
            // height: 500,
          ),
          Image.asset(
            'assets/images/onboarding_image_3.png',
            // height: 500,
          ),
        ],
        totalPage: 3,
        speed: 2.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'Welcome to CashBuddy!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Your loyal companion for managing your finances wisely.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'Track your Income',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Effortlessly track your income and expenses with CashBuddy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'Automatic Notifications and Transfers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Securely link your bank accounts to automate transaction tracking.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
