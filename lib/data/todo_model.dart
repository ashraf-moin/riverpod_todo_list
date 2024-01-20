import 'dart:convert';

class TODOModel {
  final String title;
  final bool isCompleted;

  TODOModel({
    required this.title,
    required this.isCompleted,
  });




  // Convert TODOModel to a map (to store in SharedPreferences)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // Create a TODOModel instance from a map (loaded from SharedPreferences)
  factory TODOModel.fromMap(Map<String, dynamic> map) {
    return TODOModel(
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }

  // Convert TODOModel to JSON string
  String toJsonString() {
    return '{"title": "$title", "isCompleted": $isCompleted}';
  }

  // Create a TODOModel instance from JSON string
  factory TODOModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> map = json.decode(jsonString);
    return TODOModel.fromMap(map);
  }

}
