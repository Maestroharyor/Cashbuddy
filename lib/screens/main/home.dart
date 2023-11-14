import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/home/home_screen_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
          child: SingleChildScrollView(
            child: HomeScreenContainer(),
          ),
        ));
  }
}
