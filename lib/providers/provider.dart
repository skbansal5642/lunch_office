import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lunch_office/model/activity.dart';
import 'package:lunch_office/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<Activity> activity(ActivityRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https('bored-api.appbrewery.com', 'random'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return Activity.fromJson(json);
}

// @riverpod
// Future<List<Todo>> todoList(TodoListRef ref) async {
//   // Simulate a network request. This would normally come from a real API
//   return [
//     Todo(description: 'Learn Flutter', completed: true),
//     Todo(description: 'Learn Riverpod'),
//   ];
// }

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    // The logic we previously had in our FutureProvider is now in the build method.
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo, List<Todo> todoList) async {
    // Call any API here and set response data.

    todoList.add(todo);

    print("updating state...");
    // We update the local cache to match the new state.
    // This will notify all listeners.
    state = AsyncData(todoList);
    print("state updated...");
  }
}
