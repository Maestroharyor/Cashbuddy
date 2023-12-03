import 'dart:ffi';

import 'package:cashbuddy/data/index.dart';
import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/auth_provider/provider.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';
import 'package:cashbuddy/providers/user_provider/user.dart';
import 'package:cashbuddy/routes/index.dart';
import 'package:cashbuddy/widgets/elements/cb_text.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsContainer extends ConsumerWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(authUserProvider);
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 60),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.blue[900]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Hi,' + user.value!.firstName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                  ],
                ),
              ]),
        ),
        Transform.translate(
          offset: const Offset(0, -30),
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.grey[100]),
            child: const Column(
              children: [
                ProfileInformationSection(),
                SizedBox(
                  height: 20,
                ),
                AccountSettingsSection(),
                SizedBox(
                  height: 20,
                ),
                OtherSettingsSection()
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class ProfileInformationSection extends ConsumerWidget {
  const ProfileInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(authUserProvider);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: user.value!.username,
                      maxCharacters: 15,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    // Icon(Icons.edit, color: Colors.grey)
                    IconButton(
                        onPressed: () {
                          _showEditUserameModalDialog(context);
                        },
                        icon: const Icon(Icons.edit))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: user.value!.firstName + " " + user.value!.lastName,
                      maxCharacters: 15,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          _showEditFullnameModalDialog(context);
                        },
                        icon: const Icon(Icons.edit))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: user.value!.email,
                      maxCharacters: 15,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          _showEditEmailModalDialog(context);
                        },
                        icon: const Icon(Icons.edit))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: user.value!.phoneNumber,
                      maxCharacters: 15,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          _showEditPhoneNumberModalDialog(context);
                        },
                        icon: const Icon(Icons.edit))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SearchField(
            // controller: selectedCategoryTitleController,
            key: const Key('searchfield'),
            hint: 'Search Currencies',
            itemHeight: 50,
            scrollbarDecoration: ScrollbarDecoration(),
            onTapOutside: (x) {},
            searchInputDecoration: const InputDecoration(
                suffixIcon: Icon(Icons.arrow_drop_down),
                labelText: "Preffered Currency"),
            emptyWidget: Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: const Text(
                  "Currency not found",
                  style: TextStyle(color: Colors.grey),
                )),
            suggestionsDecoration: SuggestionDecoration(
              color: Colors.grey[100],
            ),
            suggestions: currencies
                .map((e) => SearchFieldListItem<String>(e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 12),
                      child: Text(e,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor)),
                    )))
                .toList(),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Get Budget Notifications",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Switch(
                  value:
                      true, // Set the initial value (true for "on", false for "off")
                  onChanged: (bool newValue) {
                    // Handle the onChanged event
                    print('Switch value changed to: $newValue');
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Allow Automatic Transfer",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Coming Soon",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Switch(
                  value:
                      false, // Set the initial value (true for "on", false for "off")
                  onChanged: (bool newValue) {
                    // Handle the onChanged event
                    print('Switch value changed to: $newValue');
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!, // specify your color here
                width: 1.0, // specify the border width
              ),
            )),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connect Bank Accounts",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Coming Soon",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Material(
            // borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            animationDuration: const Duration(milliseconds: 100),
            child: InkWell(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(context, forgotPasswordRoute);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, top: 15),
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
                          // Icon(Icons.account_circle_rounded,
                          //     color: Colors.grey[600]),
                          // const SizedBox(
                          //   width: 15,
                          // ),
                          Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        // children: [
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const AccountInfoScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.account_circle_rounded,
        //                       color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Account Info",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 25,
        //   ),
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     const SettingsMainScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.settings, color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Settings",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 25,
        //   ),
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     const LoginAndSecurityScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.lock, color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Login and Security",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}

class OtherSettingsSection extends ConsumerWidget {
  const OtherSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(authUserProvider);
    void _showLogoutModal() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          // height: 600,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Log Out",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    // Get SharedPreferences instance
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    // Clear all data
                    await prefs.clear();

                    CashbuddyUser user = CashbuddyUser(
                        id: "",
                        firstName: "",
                        lastName: "",
                        country: "",
                        email: "",
                        phoneNumber: "",
                        username: "",
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        userRole: "");
                    ref.read(authUserProvider.notifier).setUser(user);
                    ref.read(authProvider.notifier).logoutAuthUser();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, loginRoute);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0)),
                  child: const Text("Logout"),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0)),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Material(
            // borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            animationDuration: const Duration(milliseconds: 100),
            child: InkWell(
              onTap: () {
                _showLogoutModal();
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, top: 15),
                // decoration: const BoxDecoration(
                //     // color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.grey[600]),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        // children: [
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const AccountInfoScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.account_circle_rounded,
        //                       color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Account Info",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 25,
        //   ),
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     const SettingsMainScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.settings, color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Settings",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 25,
        //   ),
        //   Material(
        //     borderRadius: BorderRadius.circular(8),
        //     clipBehavior: Clip.hardEdge,
        //     color: Colors.grey[100],
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     const LoginAndSecurityScreen()));
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(30),
        //         // decoration: const BoxDecoration(
        //         //     // color: Colors.white,
        //         //     borderRadius: BorderRadius.all(Radius.circular(8))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.lock, color: Colors.grey[600]),
        //                   const SizedBox(
        //                     width: 15,
        //                   ),
        //                   Text(
        //                     "Login and Security",
        //                     style: TextStyle(
        //                         color: Colors.grey[600],
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 30,
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               color: Theme.of(context).primaryColor,
        //               size: 30,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}

_showEditUserameModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            // constraints: const BoxConstraints(maxHeight: 350),
            height: 235,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Nickname",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder(),
                        label: const Text("Nickname")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          )),
                      child: const Text(
                        'Update Nickname',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

_showEditFullnameModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            // constraints: const BoxConstraints(maxHeight: 350),
            height: 315,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Full Name",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder(),
                        label: const Text("First Name")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder(),
                        label: const Text("Last Name")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          )),
                      child: const Text(
                        'Update Full Name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

_showEditEmailModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            // constraints: const BoxConstraints(maxHeight: 350),
            height: 235,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Email",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder(),
                        label: const Text("Email Address")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          )),
                      child: const Text(
                        'Update Email Address',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

_showEditPhoneNumberModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
            // constraints: const BoxConstraints(maxHeight: 350),
            height: 235,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Phone Number",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder(),
                        label: const Text("Phone Number")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          )),
                      child: const Text(
                        'Update Phone Number',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
