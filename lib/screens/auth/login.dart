import 'package:flutter/material.dart';
import 'package:cashbuddy/routes/index.dart';

class LoginScreen extends StatefulWidget {
  @override
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          Theme.of(context).primaryColor,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        )),
                    onPressed: () {
                      // Access email and password using _emailController.text and _passwordController.text
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      // Implement your login logic here
                      print('Email: $email, Password: $password');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacementNamed(
                          context, authenticatedRoute);
                    },
                    child: const Text('Login',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8.0),
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
