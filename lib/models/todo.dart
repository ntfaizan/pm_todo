class Todo {
  String id;
  String message;

  Todo({
    required this.id,
    required this.message,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      message: json['msg'],
    );
  }
}
