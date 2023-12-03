import 'dart:math';

import 'package:cashbuddy/models/all_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cashbuddy/providers/user_provider/user.dart';
import 'package:cashbuddy/providers/user_provider/provider.dart';

String generateRandomText(int length) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  Random random = Random();
  String result = '';

  for (int i = 0; i < length; i++) {
    result += chars[random.nextInt(chars.length)];
  }

  return result;
}

class Test extends ConsumerStatefulWidget {
  const Test({super.key});

  @override
  ConsumerState<Test> createState() => _TestState();
}

class _TestState extends ConsumerState<Test> {
  // The pending addTodo operation. Or null if none is pending.
  Future<void>? _pendingAddTodo;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<User> user = ref.watch(authUserProvider);
    // final AsyncValue<List<Todo>> todoList = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Test Page"),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: _pendingAddTodo,
              builder: (context, snapshot) {
                // Compute whether there is an error state or not.
                // The connectionState check is here to handle when the operation is retried.
                final isErrored = snapshot.hasError &&
                    snapshot.connectionState != ConnectionState.waiting;

                return SizedBox(
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) ...[
                          const SizedBox(width: 8),
                          const CircularProgressIndicator(),
                        ],
                        if (snapshot.connectionState != ConnectionState.waiting)
                          Center(
                            /// Since network-requests are asynchronous and can fail, we need to
                            /// handle both error and loading states. We can use pattern matching for this.
                            /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
                            child: switch (user) {
                              AsyncData(:final value) => Text(
                                  'Name: ${value.firstName} ${value.createdAt.month}'),
                              AsyncError() => const Text(
                                  'Oops, something unexpected happened'),
                              _ => const CircularProgressIndicator(),
                            },
                          ),
                        ElevatedButton(
                            style: ButtonStyle(
                              // If there is an error, we show the button in red
                              backgroundColor: MaterialStateProperty.all(
                                isErrored ? Colors.red : null,
                              ),
                            ),
                            onPressed: () {
                              CashbuddyUser data = CashbuddyUser(
                                  firstName: generateRandomText(10));

                              final future = ref
                                  .read(authUserProvider.notifier)
                                  .updateUser(data);
                              // We store that future in the local state
                              setState(() {
                                _pendingAddTodo = future;
                              });
                            },
                            child: const Text("Update")),

                        // The operation is pending, let's show a progress indicator
                      ]),
                );
              })),
    );
  }
}
