import 'dart:async';
import 'package:cashbuddy/routes/index.dart';
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
                if (_currentStep == 1) _buildStepOne(),
                if (_currentStep == 2) _buildStepTwo(),
                if (_currentStep == 3) _buildStepThree(),
              ],
            ),
          ),
        ),
      ),
    );
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

  void _showPasswordFields() {
    // Set a delay to allow time for the keyboard to dismiss before showing the password fields
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _countdown = 0;
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
        Image.asset(
          'assets/images/forgot_password.png',
          height: 200,
        ),
        const SizedBox(height: 16.0),
        Text(
          'Reset Password',
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
              setState(() {
                _currentStep = 2;
                _isOtpSent = true;
              });
              _startTimer();
            },
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
      ),
      const SizedBox(height: 16.0),
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
            setState(() {
              _currentStep = 3;
            });
          },
          child: const Text(
            'Verify OTP',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      if (_isOtpSent && _countdown == 0)
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: const ButtonStyle(alignment: Alignment.center),
            onPressed: () {
              // Implement logic to resend OTP
              // Start the countdown timer
              if (_countdown == 0) {
                setState(() {
                  _countdown = 60;
                  _startTimer();
                });
              }
            },
            child: const Text('Resend OTP'),
          ),
        ),
      if (!(_isOtpSent && _countdown == 0))
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Text('Resend OTP in $_countdown', textAlign: TextAlign.center),
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
      const SizedBox(height: 20.0),
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
            // setState(() {
            //   _currentStep = 3;
            // });
            _showToast("Password Changed", Colors.green);
            Navigator.pushReplacementNamed(context, loginRoute);
          },
          child: const Text(
            'Change Password',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
