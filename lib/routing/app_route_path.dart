class AppRoutePath {
  
  final int? selectedTodoId;
  final bool _isError;

  AppRoutePath.todoList(): this.selectedTodoId = null, _isError = false;

  AppRoutePath.todoDetail(this.selectedTodoId) : _isError = false;

  AppRoutePath.error()
      : selectedTodoId = null,
        _isError = true;

  bool get isTodoListPage => selectedTodoId == null;

  bool get isTodoDetailsPage => selectedTodoId != null;

  bool get isErrorPage => _isError;

}