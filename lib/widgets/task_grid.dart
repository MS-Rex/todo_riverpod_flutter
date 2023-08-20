import 'package:flutter/material.dart';
import 'package:practise_app/models/data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practise_app/provider/todo_provider.dart';

class GridTaskItem extends ConsumerStatefulWidget {
  const GridTaskItem({super.key, required this.todotaskk});
  final TodoTask todotaskk;

  @override
  ConsumerState<GridTaskItem> createState() => _GridTaskItemState();
}

class _GridTaskItemState extends ConsumerState<GridTaskItem> {
  //final bool isCompleted = ref.watch(todoLearn.notifier);
  //widget.todotaskk.isCompleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
          onTap: () {
            ref.read(todoLearn.notifier).TodoDeleted(widget.todotaskk);
          },
          child: const Icon(
            Icons.delete_forever_outlined,
            color: Colors.red,
          )),
      title: Text(
        widget.todotaskk.taskName,
        style: widget.todotaskk.isCompleted
            ? const TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.redAccent)
            : const TextStyle(),
      ),
      trailing: Checkbox(
          value: widget.todotaskk.isCompleted,
          onChanged: (value) {
            ref.read(todoLearn.notifier).isCompleted(widget.todotaskk);
          }),
    );
  }
}
