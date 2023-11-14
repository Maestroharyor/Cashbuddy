import 'package:flutter/material.dart';
import 'package:cashbuddy/screens/sub/account_info.dart';
import 'package:cashbuddy/screens/sub/login_and_security.dart';
import 'package:cashbuddy/screens/sub/settings_main.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 100),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.blue[900]),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                  ],
                ),
              ]),
        ),
        Transform.translate(
          offset: const Offset(0, -80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.network(
                    "https://i.pravatar.cc/300",
                    fit: BoxFit.cover,
                    // color: Colors.grey[900],
                    loadingBuilder: (context, child, loadingProgress) {
                      // ignore: unnecessary_null_comparison
                      if (child == null) {
                        return Container(
                          color: Colors.grey[900],
                        );
                      } else {
                        return child;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "maestro@thelifetechfacts.com",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountInfoScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      // decoration: const BoxDecoration(
                      //     // color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.account_circle_rounded,
                                    color: Colors.grey[600]),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Account Info",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SettingsMainScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      // decoration: const BoxDecoration(
                      //     // color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.settings, color: Colors.grey[600]),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginAndSecurityScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      // decoration: const BoxDecoration(
                      //     // color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.lock, color: Colors.grey[600]),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Login and Security",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
