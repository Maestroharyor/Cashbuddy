import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/notifications/notifications_screen_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child:
                SingleChildScrollView(child: NotificationsScreenContainer())));
  }
}
