import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/widgets/elements/cashbuddy_loader.dart';
import 'package:flutter/material.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _isButtonEnabled = false;

  // The pending addTodo operation. Or null if none is pending.
  bool _isLoading = false;

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
  void initState() {
    super.initState();

    // Add listeners to the controllers
    _emailController.addListener(updateButtonState);
    _passwordController.addListener(updateButtonState);
    _confirmPasswordController.addListener(updateButtonState);
    _firstNameController.addListener(updateButtonState);
    _lastNameController.addListener(updateButtonState);
    _phoneNumberController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      // Enable the button only if both email and password are not empty
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          isPasswordComplex() &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  String getPasswordError() {
    if (_confirmPasswordController.text.isEmpty) {
      return ''; // Do not show error when the field is empty
    }

    String passwordError = '';

    if (_passwordController.text != _confirmPasswordController.text) {
      passwordError = 'Password and Confirm Password do not match';
    } else if (!isPasswordComplex()) {
      passwordError =
          'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special symbol';
    }

    return passwordError;
  }

  bool isPasswordComplex() {
    // Password complexity criteria: at least one uppercase, one lowercase, one digit, and one special symbol
    RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+{}|:"<>?/~`-]).{8,}$');
    return regex.hasMatch(_passwordController.text);
  }

  signupUser() async {
    try {
      setState(() {
        _isLoading = true;
      });
      // Access email and password using _emailController.text and _passwordController.text
      String email = _emailController.text;
      String password = _passwordController.text;
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String phoneNumber = _phoneNumberController.text;

      CashbuddyUser data = CashbuddyUser(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          country: "Nigeria");

      final future = ref.read(authUserProvider.notifier).signupUser(data);

      // We store that future in the local state
      future.then((value) {
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
        print("Something went wrong");
        print(e);
      });
    } catch (e) {
      print("Something went wrongaa");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      labelText: 'Phone Number',
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
                  if (_passwordController.text.isNotEmpty &&
                      !isPasswordComplex()) ...[
                    const SizedBox(height: 8.0),
                    Text(
                      "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special symbol",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                  const SizedBox(height: 16.0),
                  TextField(
                    obscureText: !_isConfirmPasswordVisible,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      // validatePasswords();
                    },
                  ),
                  if (getPasswordError().isNotEmpty) ...[
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        getPasswordError(),
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
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
                            _isButtonEnabled
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(15),
                          )),
                      onPressed: _isButtonEnabled ? signupUser : null,
                      child: const Text('Sign Up',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
