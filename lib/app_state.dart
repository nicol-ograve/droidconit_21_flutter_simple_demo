import 'package:droidconit_21_flutter_simple_demo/model/todo.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {

  static final instance = AppState._();

  final todoList = [
    Todo(id: 1, title: 'Go to the gym'),
    Todo(id: 2, title: 'Buy groceries'),
    Todo(id: 3, title: 'Write the last slide for DroidconIt'),
  ];

  Todo? _selectedTodo;
  Todo? get selectedTodo => _selectedTodo;

  AppState._();

  void selectTodo(Todo todo) {
    this._selectedTodo = todo;
    notifyListeners();
  }

  void clearSelection() {
    this._selectedTodo = null;
    notifyListeners();
  }

}
