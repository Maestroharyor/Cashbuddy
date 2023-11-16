import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/settings/settings_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const SafeArea(child: SingleChildScrollView(child: SettingsContainer())),
    );
  }
}
