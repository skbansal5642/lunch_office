import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunch_office/model/activity.dart';
import 'package:lunch_office/providers/provider.dart';

/// The homepage of our application
class Home extends ConsumerStatefulWidget {
  static const route = "home";
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();

    // State life-cycles have access to "ref" too.
    // This enables things such as adding a listener on a specific provider
    // to show dialogs/snackbars.
    ref.listenManual(activityProvider, (previous, next) {
      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hii")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // "ref" is not passed as parameter anymore, but is instead a property of "ConsumerState".
    // We can therefore keep using "ref.watch" inside "build".
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    return Scaffold(
      body: Center(
        /// Since network-requests are asynchronous and can fail, we need to
        /// handle both error and loading states. We can use pattern matching for this.
        /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
        child: switch (activity) {
          AsyncData(:final value) => Text('Activity: ${value.price}'),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
