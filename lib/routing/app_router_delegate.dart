import 'package:droidconit_21_flutter_simple_demo/app_state.dart';
import 'package:droidconit_21_flutter_simple_demo/pages/error_page.dart';
import 'package:droidconit_21_flutter_simple_demo/pages/todo_detail_page.dart';
import 'package:droidconit_21_flutter_simple_demo/pages/todo_list_page.dart';
import 'package:droidconit_21_flutter_simple_demo/routing/app_route_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  bool _showError = false;

  AppRouterDelegate() {
    AppState.instance.addListener(onNewAppState);
  }

  void onNewAppState() {
    notifyListeners();
  }

  @override
  void dispose() {
    AppState.instance.removeListener(onNewAppState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, onPopPage: _onPopPage, pages: _getPages());
  }

  List<Page> _getPages() {
    if (_showError) {
      return [MaterialPage(key: ValueKey('error'), child: ErrorPage())];
    } else {
      final appState = AppState.instance;
      return [
        MaterialPage(key: ValueKey('todoList'), child: TodoListPage()),
        if (appState.selectedTodo != null)
          MaterialPage(
              key: ValueKey('todoDetail'),
              child: TodoDetailPage(todo: appState.selectedTodo!)),
      ];
    }
  }


  @override
  Future<bool> popRoute() {
    return Future.value(_tryPop());
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    return _tryPop();
  }

  bool _tryPop() {
    if (AppState.instance.selectedTodo != null) {
      AppState.instance.clearSelection();
      return true;
    }
    return false;
  }



  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) {
    if (configuration.isErrorPage) {
      _showError = true;
      return Future.value();
    }

    _showError = false;

    if (configuration.isTodoDetailsPage) {
      AppState.instance.selectTodo(AppState.instance.todoList
          .firstWhere((todo) => todo.id == configuration.selectedTodoId));
    } else if (AppState.instance.selectedTodo != null) {
      AppState.instance.clearSelection();
    }

    return Future.value();
  }

  @override
  AppRoutePath? get currentConfiguration {
    if (_showError) {
      return AppRoutePath.error();
    } else if (AppState.instance.selectedTodo == null) {
      return AppRoutePath.todoList();
    } else {
      return AppRoutePath.todoDetail(AppState.instance.selectedTodo!.id);
    }
  }

}
