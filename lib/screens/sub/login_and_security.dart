import 'package:flutter/material.dart';
import 'package:cashbuddy/widgets/partials/settings/login_and_security_container.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const SafeArea(
            child: SingleChildScrollView(child: LoginAndSecurityContainer())));
  }
}
