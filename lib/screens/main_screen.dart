import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practise_app/provider/todo_provider.dart';
import 'package:practise_app/widgets/task_grid.dart';
import 'package:practise_app/screens/bottom_screen.dart';

class TodoeyScreen extends StatelessWidget {
  const TodoeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todocontroler = TextEditingController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Todo Buddy',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Consumer(
                    builder: (_, ref, __) {
                      final ccount = ref.watch(todoLearn).length;
                      return Text("${ccount.toString()} Tasks");
                    },
                  ),
                ],
              ),
            ),
          ),
          Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.loose,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.752,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final stateProvider2 = ref.watch(todoLearn);

                      return ListView(
                        children: [
                          for (final tasks in stateProvider2)
                            GridTaskItem(todotaskk: tasks)
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  //right: 20,
                  bottom: 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        bottomSheet(context, todocontroler);
                      },
                      child: const Text('Add Todo',
                          style: TextStyle(color: Colors.white))),
                )
              ])
        ],
      ),
    );
  }
}
