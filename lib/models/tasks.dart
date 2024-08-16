class Tasks {
  String id;
  List<String> name = [];
  bool isCompleted = false;

  Tasks({
    required this.id,
    required this.name,
    required this.isCompleted,
  });

  Tasks.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = List<String>.from(map['name']),
        isCompleted = map['isCompleted'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted,
    };
  }
}
