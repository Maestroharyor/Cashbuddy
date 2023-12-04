// import 'package:cashbuddy/widgets/elements/cashbuddy_loader.dart';

import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/auth_provider/auth.dart';
import 'package:cashbuddy/providers/auth_provider/provider.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/widgets/elements/cashbuddy_loader.dart';
import 'package:flutter/material.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isButtonEnabled = false;

  // The pending addTodo operation. Or null if none is pending.
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to the controllers
    _emailController.addListener(updateButtonState);
    _passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      // Enable the button only if both email and password are not empty
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    // Access email and password using _emailController.text and _passwordController.text
    String email = _emailController.text;
    String password = _passwordController.text;

    CashbuddyUser data = CashbuddyUser(email: email, password: password);

    final future = ref.read(authUserProvider.notifier).loginUser(data);

    // print(future);
    future.then((value) {
      print({value});
      print(value['success']);
      if (value['success']) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, authenticatedRoute);
      } else {
        _showErrorModal(
            value['message'] ?? "An error occured when logging you in");
      }
      setState(() {
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
      });
      print("Something went wrong login");
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<AuthModel> auth = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: CashBuddyLoader(
          isLoading: _isLoading,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login.png',
                  height: 200,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Login to your account',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigate to the Forgot Password screen
                        Navigator.pushNamed(context, forgotPasswordRoute);
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          _isButtonEnabled
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.6),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        )),
                    onPressed: _isButtonEnabled ? loginUser : null,
                    child: const Text('Login',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8.0),
                // Text(
                //   user.value!.firstName.isNotEmpty
                //       ? user.value!.firstName
                //       : 'No first name',
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   auth.value!.token.isNotEmpty
                //       ? auth.value!.token
                //       : 'No token',
                //   style: TextStyle(color: Colors.black),
                // ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      // Navigate to the Register screen
                      Navigator.pushNamed(context, registerRoute);
                    },
                    child: const Text('Register'),
                  )
                ])
              ],
            ),
          ),
        )),
      ),
    );
  }

  void _showErrorModal(String message) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 20),
            const Text(
              "An Error Occured",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(message),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16)),
                child: const Text("OK"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
