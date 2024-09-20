import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lunch_office/model/todo.dart';
import 'package:lunch_office/providers/provider.dart';

class Example extends HookConsumerWidget {
  static const route = "example";
  Example({super.key});

  final appCount = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The pending addTodo operation. Or null if none is pending.
    final pendingAddTodo = useState<Future<void>?>(null);
    // We listen to the pending operation, to update the UI accordingly.
    final snapshot = useFuture(pendingAddTodo.value);

    // Compute whether there is an error state or not.
    // The connectionState check is here to handle when the operation is retried.
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;

    final todoList = ref.watch(todoListProvider).value;

    final count = ref.watch(appCount);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    // If there is an error, we show the button in red
                    backgroundColor: WidgetStatePropertyAll(
                      isErrored ? Colors.red : Colors.green,
                    ),
                  ),
                  onPressed: () async {
                    // Using "ref.read" combined with "myProvider.notifier", we can
                    // obtain the class instance of our notifier. This enables us
                    // to call the "addTodo" method.

                    // Although ref.watch could technically work,
                    // it is recommended to use ref.read
                    // when logic is performed in event handlers such as "onPressed".

                    // We keep the future returned by addTodo in a variable
                    final future = ref.read(todoListProvider.notifier).addTodo(Todo(description: 'This is a new todo'), todoList ?? []);

                    // We store that future in the local state
                    pendingAddTodo.value = future;
                    print(ref.watch(todoListProvider).value?.length.toString());
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // The operation is pending, let's show a progress indicator
                if (snapshot.connectionState == ConnectionState.waiting) ...[
                  const SizedBox(width: 8),
                  const CircularProgressIndicator(),
                ]
              ],
            ),
            Text(
              todoList?.length.toString() ?? '',
            ),
            Center(
              child: Text('$count'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(appCount.notifier).state++;
          },
          child: const Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
