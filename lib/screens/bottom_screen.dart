import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practise_app/provider/todo_provider.dart';
import 'package:practise_app/models/data_model.dart';

Future<void> bottomSheet(
    BuildContext context, TextEditingController todocontroler) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          //padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 118, 193, 255)),
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Consumer(
                //   builder: (context, ref, child) {
                //     final currentTime = ref.watch(clockProvider);
                //     final timeFormatted = DateFormat.Hms().format(currentTime);
                //     return Text(timeFormatted);
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Let's Plan my ToDos! ",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 1,
                  controller: todocontroler,
                  decoration: InputDecoration(
                    hintText: "Enter your Todo",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 204, 222, 254),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    // final stateProvider = ref.watch(todoLearn);
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Add Todo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        ref
                            .read(todoLearn.notifier)
                            .TodoAdded(todoAdder(todocontroler.text));

                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

TodoTask todoAdder(String todo) {
  return TodoTask(taskName: todo, isCompleted: false);
}
