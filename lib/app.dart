import 'dart:convert';

import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/screens/main/splash.dart';
import 'package:cashbuddy/screens/sub/add_new_expense.dart';
import 'package:cashbuddy/screens/sub/add_new_income.dart';
import 'package:cashbuddy/screens/sub/add_plan.dart';
import 'package:cashbuddy/screens/sub/calculate_budget.dart';
import 'package:cashbuddy/screens/sub/edit_plan.dart';
import 'package:cashbuddy/screens/sub/notifications.dart';
import 'package:cashbuddy/screens/sub/reports.dart';
import 'package:flutter/material.dart';
import 'package:cashbuddy/config/theme/app_theme.dart';
import 'package:cashbuddy/data/index.dart';
import 'package:cashbuddy/screens/auth/forgot_password.dart';
import 'package:cashbuddy/screens/auth/login.dart';
import 'package:cashbuddy/screens/auth/register.dart'; // Import your register screen
import 'package:cashbuddy/screens/auth/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashbuddy/screens/main/Home.dart';
import 'package:cashbuddy/screens/main/Plans.dart';
import 'package:cashbuddy/screens/main/Settings.dart';
import 'package:cashbuddy/screens/main/Transactions.dart';
import 'package:cashbuddy/screens/main/add_new.dart';
import "package:cashbuddy/routes/index.dart";

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  late SharedPreferences _prefs;
  bool _isOnboardingViewed = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isOnboardingViewed = _prefs.getBool('showOnboarding') ?? false;
      print(_isOnboardingViewed);
      print(_prefs.getBool('showOnboarding'));
      // _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    });

    final String? userJson = _prefs.getString('user');

    if (userJson != null) {
      print("User has logged in");

      CashbuddyUser user = CashbuddyUser(
        id: jsonDecode(userJson)['id'],
        firstName: jsonDecode(userJson)['firstName'],
        lastName: jsonDecode(userJson)['lastName'],
        username: jsonDecode(userJson)['username'],
        email: jsonDecode(userJson)['email'],
        password: jsonDecode(userJson)['password'],
        phoneNumber: jsonDecode(userJson)['phoneNumber'],
        country: jsonDecode(userJson)['country'],
        userRole: jsonDecode(userJson)['userRole'],
        createdAt: DateTime.parse(jsonDecode(userJson)['createdAt']),
        updatedAt: DateTime.parse(jsonDecode(userJson)['updatedAt']),
        token: jsonDecode(userJson)['token'],
      );

      ref.read(authUserProvider.notifier).setUser(user);

      // Use the user data as needed
    } else {
      // Handle the case where user data is not available
      print("User hasn't logged in");
    }
  }

  _setOnboardingViewed() {
    setState(() {
      _isOnboardingViewed = false;
      _prefs.setBool('showOnboarding', false);
      print("Onboarding viewed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      initialRoute: splashRoute,
      // initialRoute:
      //     _isOnboardingViewed == false ? onboardingRoute : authenticatedRoute,
      // initialRoute: '/test',
      theme: appTheme,
      routes: {
        splashRoute: (context) =>
            SplashScreen(showOnboarding: _isOnboardingViewed),
        onboardingRoute: (context) =>
            OnboardingScreen(setOnboardingViewed: _setOnboardingViewed),
        loginRoute: (context) => const LoginScreen(),
        forgotPasswordRoute: (context) => const ForgotPasswordScreen(),
        registerRoute: (context) => const RegisterScreen(),
        authenticatedRoute: (context) => const AuthenticatedScreen(),
        homeScreenRoute: (context) => const HomeScreen(),
        transactionsRoute: (context) => const TransactionsScreen(),
        addNewRoute: (context) => const AddNewScreen(),
        plansRoutes: (context) => const PlansScreen(),
        settingsRoute: (context) => const SettingsScreen(),
        addNewExpenseRoute: (context) => const AddNewExpenseScreen(),
        addNewIncomeRoute: (context) => const AddNewIncomeScreen(),
        notificationsRoute: (context) => const NotificationsScreen(),
        reportsRoute: (context) => const ReportsScreen(),
        addPlanRoute: (context) => const AddPlan(),
        calculateBudgetRoute: (context) => const CalculateBudget(),
        // '/test': (context) => const Test(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == editPlanRoute) {
          // Extract parameters from settings.arguments
          Map<String, dynamic> arguments =
              settings.arguments as Map<String, dynamic>;

          // Extract DisbursementPlan from the map
          DisbursementPlan plan = arguments['plan'] as DisbursementPlan;

          return MaterialPageRoute(
            builder: (context) => EditPlan(plan: plan),
          );
        }
        return null;
      },
    );
  }
}

class AuthenticatedScreen extends StatefulWidget {
  const AuthenticatedScreen({super.key});

  @override
  State<AuthenticatedScreen> createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const TransactionsScreen(),
    const AddNewScreen(),
    const PlansScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 11),
        selectedLabelStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 11),
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 22,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.currency_exchange,
              size: 22,
            ),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Transform.translate(
              offset: const Offset(0.0, 5.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.track_changes, size: 22),
            label: 'Plans',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 22),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
