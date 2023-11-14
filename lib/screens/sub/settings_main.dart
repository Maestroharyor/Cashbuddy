import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/settings/settings_main_container.dart';

class SettingsMainScreen extends StatelessWidget {
  const SettingsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child: SingleChildScrollView(child: SettingsMainContainer())));
  }
}
