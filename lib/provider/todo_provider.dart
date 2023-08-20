import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practise_app/data/dummy_data.dart';
import 'package:practise_app/models/data_model.dart';

class TodoLearn extends StateNotifier<List<TodoTask>> {
  TodoLearn() : super(tasks);

  void isCompleted(TodoTask todo) {
    final indexToAddAt = state.indexOf(todo);

    state =
        state.where((element) => element.taskName != todo.taskName).toList();
    final numbers = state;
    if (indexToAddAt >= 0 && indexToAddAt <= numbers.length) {
      final List<TodoTask> updatedNumbers =
          List.from(numbers); // Create a new list
      updatedNumbers.insert(indexToAddAt,
          TodoTask(taskName: todo.taskName, isCompleted: !todo.isCompleted));

      state = updatedNumbers;
    } else {
      print("Invalid index.");
    }
  }

  void TodoAdded(TodoTask newTodo) {
    state = [...state, newTodo];
  }

  TodoDeleted(TodoTask oldTodo) {
    state =
        state.where((element) => element.taskName != oldTodo.taskName).toList();
  }
}

final todoLearn = StateNotifierProvider<TodoLearn, List<TodoTask>>((ref) {
  return TodoLearn();
});
