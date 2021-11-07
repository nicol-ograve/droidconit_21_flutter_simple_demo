class Todo {
  int id;
  String title;

  Todo({
    required this.id,
    required this.title
  });

  Todo copyWith({
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title
    );
  }
}
