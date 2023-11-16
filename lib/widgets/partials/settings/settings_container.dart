import 'package:cashbuddy/widgets/elements/cb_text.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const Text('Hi, Maestro',
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
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class ProfileInformationSection extends StatelessWidget {
  const ProfileInformationSection({
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
                Text(
                  "Nickname",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: "Maestrojosh",
                      maxCharacters: 18,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.edit, color: Colors.grey)
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 30),
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
                Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: "Maestro Joshua",
                      maxCharacters: 18,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.edit, color: Colors.grey)
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 30),
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
                Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: "Maestro@thelifetechfacts.com",
                      maxCharacters: 18,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.edit, color: Colors.grey)
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 30),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Row(
                  children: [
                    CBText(
                      text: "+234903272727",
                      maxCharacters: 18,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.edit, color: Colors.grey)
                  ],
                )
              ],
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
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            // decoration: BoxDecoration(
            //     border: Border(
            //   bottom: BorderSide(
            //     color: Colors.grey[400]!, // specify your color here
            //     width: 1.0, // specify the border width
            //   ),
            // )),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: Colors.grey)
              ],
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
