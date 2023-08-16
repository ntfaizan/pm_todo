import 'package:flutter/material.dart';
import 'package:pm_todo/models/todo.dart';
import 'package:pm_todo/utils/collection.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {
  EditPage({super.key, required this.initData, required this.todo});
  final Function initData;
  Todo todo;
  final msgControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: msgControl..text = todo.message,
          ),
          FilledButton(
            onPressed: () {
              editTodo(context);
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  Future<void> editTodo(BuildContext context) async {
    final data = {
      'id': todo.id,
      'msg': msgControl.text,
    };
    await Collection.posts.doc(todo.id).set(data);
    msgControl.clear();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Record Updated')));
    initData();
  }
}
