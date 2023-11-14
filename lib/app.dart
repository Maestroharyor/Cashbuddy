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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late SharedPreferences _prefs;
  bool _showOnboarding = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _showOnboarding = _prefs.getBool('showOnboarding') ?? true;
      // _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    });
  }

  _setOnboardingViewed() {
    setState(() {
      _showOnboarding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: _showOnboarding ? onboardingRoute : authenticatedRoute,
      theme: appTheme,
      routes: {
        onboardingRoute: (context) =>
            OnboardingScreen(setOnboardingViewed: _setOnboardingViewed),
        loginRoute: (context) => const LoginScreen(),
        forgotPasswordRoute: (context) => const ForgotPassword(),
        registerRoute: (context) => const RegisterScreen(),
        authenticatedRoute: (context) => const AuthenticatedScreen(),
        homeScreenRoute: (context) => const HomeScreen(),
        transactionsRoute: (context) => const TransactionsScreen(),
        addNewRoute: (context) => const AddNewScreen(),
        plansRoutes: (context) => const PlansScreen(),
        settingsRoute: (context) => const SettingsScreen(),
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
            icon: Icon(Icons.settings, size: 22),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   _MainAppState createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   late SharedPreferences _prefs;
//   bool _showOnboarding = true;
//   bool _isLoggedIn = false;
//   bool _isRegisterScreen = false;
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const TransactionsScreen(),
//     const AddNewScreen(),
//     const PlansScreen(),
//     const SettingsScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadPreferences();
//   }

//   _loadPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _showOnboarding = _prefs.getBool('showOnboarding') ?? true;
//       _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
//     });
//   }

//   _setOnboardingViewed() {
//     setState(() {
//       _showOnboarding = false;
//     });
//   }

//   _login() {
//     setState(() {
//       _isLoggedIn = true;
//     });
//   }

//   _logout() {
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_showOnboarding) {
//       return _buildOnboardingScreen();
//     } else {
//       if (_isLoggedIn) {
//         return _buildMainApp();
//       }
//       if (_isRegisterScreen && !_isLoggedIn) {
//         return _buildRegisterScreen();
//       }

//       if (!_isLoggedIn) {
//         return _buildLoginScreen();
//       }

//       return _buildMainApp();
//     }
//   }

//   Widget _buildOnboardingScreen() {
//     return OnboardingScreen(
//       onLoginPressed: _buildLoginScreen,
//       onRegisterPressed: _buildRegisterScreen,
//       setOnboardingViewed: _setOnboardingViewed,
//     );
//   }

//   Widget _buildLoginScreen() {
//     _setOnboardingViewed();
//     return LoginScreen(
//       onLoginSuccess: () {
//         _login();
//       },
//     );
//   }

//   Widget _buildRegisterScreen() {
//     _setOnboardingViewed();
//     setState(() {
//       _isRegisterScreen = true;
//     });
//     return RegisterScreen(
//       onRegisterSuccess: () {
//         _login();
//       },
//     );
//   }

//   Widget _buildMainApp() {
//     return Scaffold(
//       body: _buildMainContent(),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: Colors.grey,
//         unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 11),
//         selectedLabelStyle:
//             TextStyle(color: Theme.of(context).primaryColor, fontSize: 11),
//         selectedItemColor: Theme.of(context).primaryColor,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         showUnselectedLabels: true,
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               size: 22,
//             ),
//             label: 'Home',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(
//               Icons.currency_exchange,
//               size: 22,
//             ),
//             label: 'Transactions',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Transform.translate(
//               offset: const Offset(0.0, 5.0),
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 child: const Icon(
//                   Icons.add,
//                   size: 24,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             label: '',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.track_changes, size: 22),
//             label: 'Plans',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.settings, size: 22),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainContent() {
//     return IndexedStack(
//       index: _currentIndex,
//       children: _pages,
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: MainApp(),
//   ));
// }
