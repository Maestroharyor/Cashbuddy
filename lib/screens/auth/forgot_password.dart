import 'dart:async';
import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:cashbuddy/utils/app_functions.dart';
import 'package:cashbuddy/widgets/elements/cashbuddy_loader.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isTimerRunning = false;
  int _countdown = 60;
  int _currentStep = 1;
  bool _isOtpSent = false;
  bool _isStep1ButtonEnabled = false;
  bool _isStep2ButtonEnabled = false;
  bool _isStep3ButtonEnabled = false;
  int _resendOtpCount = 1;

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

  resetPassword() async {
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    CashbuddyUser data = CashbuddyUser(email: email);

    final future = ref.read(authUserProvider.notifier).resetPassword(data);
    future.then((value) {
      print(value['success']);
      if (value['success']) {
        // setState(() {

        // });
        if (_currentStep == 1) {
          setState(() {
            _currentStep = 2;
          });
        } else {
          setState(() {
            _resendOtpCount++;
          });

          final count = _resendOtpCount == 1 ? 60 : (_resendOtpCount + 1);
          setState(() {
            _countdown = count * 60;
          });
        }

        _isOtpSent = true;
        _startTimer();
      } else {
        _showErrorModal(value['message'] ??
            "An error occured while resetting your password");
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
  }

  verifyResetPassword() async {
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    String otp = _otpController.text;
    String newPassword = _newPasswordController.text;
    CashbuddyUser data =
        CashbuddyUser(email: email, otp: otp, password: newPassword);

    print(data.otp);

    final future =
        ref.read(authUserProvider.notifier).verifyResetPassword(data);
    future.then((value) {
      print(value['success']);
      if (value['success']) {
        _showToast("Password Changed", Colors.green);
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, loginRoute);
        });
      } else {
        _showErrorModal(value['message'] ??
            "An error occured while resetting your password");
        // setState(() {
        //   _isLoading = false;
        // });
      }
    }).catchError((e) {
      print("Something went wrong");
      print(e);
    });
  }

  void goBack() {
    print(_currentStep);
    switch (_currentStep) {
      case 3:
        setState(() {
          _currentStep = 2;
          _newPasswordController.clear();
          _confirmPasswordController.clear();
        });
        break;
      case 2:
        setState(() {
          _currentStep = 1;
          _otpController.clear();
        });
        break;

      default:
    }
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countdown == 0) {
          setState(() {
            _isTimerRunning = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _countdown--;
          });
        }
      },
    );
  }

  void gotoPassword() {
    setState(() {
      _currentStep = 3;
    });
  }

  String getPasswordError() {
    if (_confirmPasswordController.text.isEmpty) {
      return ''; // Do not show error when the field is empty
    }

    String passwordError = '';

    if (_newPasswordController.text != _confirmPasswordController.text) {
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
    return regex.hasMatch(_newPasswordController.text);
  }

  @override
  void initState() {
    super.initState();

    // Add listeners to the controllers
    _emailController.addListener(updateStep1ButtonState);
    _otpController.addListener(updateStep2ButtonState);
    _newPasswordController.addListener(updateStep3ButtonState);
    _confirmPasswordController.addListener(updateStep3ButtonState);
  }

  void updateStep1ButtonState() {
    setState(() {
      _isStep1ButtonEnabled = _emailController.text.isNotEmpty;
    });
  }

  void updateStep2ButtonState() {
    setState(() {
      _isStep2ButtonEnabled = _otpController.text.isNotEmpty;
    });
  }

  void updateStep3ButtonState() {
    setState(() {
      _isStep3ButtonEnabled = _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          isPasswordComplex();
    });
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (Navigator.canPop(context))
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/forgot_password.png',
                    height: 200,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 20.0),
                  if (_currentStep == 1) _buildStepOne(),
                  if (_currentStep == 2) _buildStepTwo(),
                  if (_currentStep == 3) _buildStepThree(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPasswordFields() {
    // Set a delay to allow time for the keyboard to dismiss before showing the password fields
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        // _countdown = 0;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildStepOne() {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email Address',
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                _emailController.text.isNotEmpty
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.6),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(15),
              ),
            ),
            onPressed: _emailController.text.isNotEmpty ? resetPassword : null,
            child: const Text(
              'Request OTP',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepTwo() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 36.0),
      const Text(
        "Enter OTP sent to your email",
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 16.0),
      Pinput(
        controller: _otpController,
        length: 6,
        onCompleted: (pin) => print(pin),
        keyboardType: TextInputType.visiblePassword,
      ),
      const SizedBox(height: 24.0),
      SizedBox(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              _otpController.text.isNotEmpty
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
          ),
          onPressed: _otpController.text.isNotEmpty ? gotoPassword : null,
          child: const Text(
            'Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      SizedBox(
        height: 16,
      ),
      SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
              side: BorderSide(color: Colors.grey[400]!, width: 1.0)),
          onPressed: goBack,
          child: const Text(
            'Back',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      if (_isOtpSent && _countdown == 0)
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: const ButtonStyle(alignment: Alignment.center),
            onPressed: resetPassword,
            child: const Text('Resend OTP'),
          ),
        ),
      if (!(_isOtpSent && _countdown == 0))
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Resend OTP in ' + formatDuration(_countdown),
                textAlign: TextAlign.center),
          ),
        ),
    ]);
  }

  Widget _buildStepThree() {
    return Column(children: [
      TextField(
        controller: _newPasswordController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: 'New Password',
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
      if (_newPasswordController.text.isNotEmpty && !isPasswordComplex()) ...[
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
        controller: _confirmPasswordController,
        obscureText: !_isConfirmPasswordVisible,
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
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
          ),
        ),
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
      const SizedBox(height: 20.0),
      SizedBox(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              _newPasswordController.text.isNotEmpty &&
                      _confirmPasswordController.text.isNotEmpty &&
                      isPasswordComplex() &&
                      _newPasswordController.text ==
                          _confirmPasswordController.text
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
          ),
          onPressed: _newPasswordController.text.isNotEmpty &&
                  _confirmPasswordController.text.isNotEmpty &&
                  isPasswordComplex() &&
                  _newPasswordController.text == _confirmPasswordController.text
              ? verifyResetPassword
              : null,
          child: const Text(
            'Change Password',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 16.0),
      SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
              side: BorderSide(color: Colors.grey[400]!, width: 1.0)),
          onPressed: goBack,
          child: const Text(
            'Back',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    ]);
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
}
