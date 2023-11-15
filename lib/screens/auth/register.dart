import 'package:flutter/material.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _showToast(String message, Color? backgroundColor) {
    toastification.show(
      context: context,
      title: message,
      autoCloseDuration: const Duration(seconds: 5),
      primaryColor: Colors.white,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      style: ToastificationStyle.fillColored,
    );
  }

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
                if (Navigator.canPop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                Image.asset(
                  'assets/images/register.png', // Add your register image path
                  height: 200,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      // Navigate to the Register screen
                      Navigator.pushNamed(context, loginRoute);
                      // if (Navigator.canPop(context)) {
                      //   Navigator.pop(context);
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginScreen(
                      //               onLoginSuccess: () =>
                      //                   widget.onRegisterSuccess(),
                      //             )),
                      //   );
                      // }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  )
                ]),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    suffixText: 'Optional',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  obscureText: !_isPasswordVisible,
                  controller: _passwordController,
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
                const SizedBox(height: 16.0),
                const Text(
                  'By creating an account, you hereby agree to the terms and conditions and privacy policy.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8.0),
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
                      ),
                    ),
                    onPressed: () {
                      // Perform basic validation
                      if (_isValidInput()) {
                        // Access input values
                        String firstName = _firstNameController.text;
                        String lastName = _lastNameController.text;
                        String phoneNumber = _phoneNumberController.text;
                        String password = _passwordController.text;

                        // Implement your registration logic here
                        print(
                            'First Name: $firstName, Last Name: $lastName, Phone Number: $phoneNumber, Password: $password');

                        // Call the callback to indicate successful registration
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.pushReplacementNamed(
                            context, authenticatedRoute);
                      } else {
                        // Show an error message for invalid input
                        _showToast(
                            "Please fill all the fields", Colors.red[700]);
                      }
                    },
                    child: const Text('Register',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidInput() {
    // Perform basic validation
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}

// class TermsConditionsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Terms and Conditions'),
//       ),
//       body: Center(
//         child: Text('Add your terms and conditions content here.'),
//       ),
//     );
//   }
// }

// class PrivacyPolicyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Privacy Policy'),
//       ),
//       body: Center(
//         child: Text('Add your privacy policy content here.'),
//       ),
//     );
//   }
// }
