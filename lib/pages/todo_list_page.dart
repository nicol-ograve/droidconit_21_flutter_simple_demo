import 'package:droidconit_21_flutter_simple_demo/app_state.dart';
import 'package:droidconit_21_flutter_simple_demo/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = AppState.instance.todoList;
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => _TodoListItem(todo: todos[index]),
            itemCount: todos.length));
  }
}

class _TodoListItem extends StatelessWidget {
  final Todo todo;

  const _TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AppState.instance.selectTodo(todo);
        },
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(16), child: Text(todo.title))
          ],
        ));
  }
}
