import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pm_todo/models/todo.dart';
import 'package:pm_todo/pages/todo/edit_page.dart';
import 'package:pm_todo/pages/todo/save_page.dart';
import 'package:pm_todo/utils/collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    QuerySnapshot<Object?> obj = await Collection.posts.get();
    todoList = obj.docs
        .map((e) => Todo.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavePage(initData: initData),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: todoList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(todoList[index].id),
                title: Text(todoList[index].message),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        deleteTodo(todoList[index].id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditPage(
                            initData: initData,
                            todo: todoList[index],
                          ),
                        ));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> deleteTodo(String id) async {
    await Collection.posts.doc(id).delete();
    initData();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Record Deleted')));
  }
}
