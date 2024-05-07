class Todo {
  int id;
  final String title;
  final String description;
  bool isChecked;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isChecked = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isChecked: json['isChecked'] ?? false,
    );
  }

  dynamic toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isChecked': isChecked,
    };
  }
}
