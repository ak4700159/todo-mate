import 'dart:ui';

class Goal {
  Goal(this.visibility, this.isFinished,
      {required this.id,
      required this.userId,
      required this.title,
      required this.color});

  Goal.from(Map<String, dynamic> jsonData)
      : id = jsonData["id"],
        title = jsonData["title"],
        color = jsonData["color"],
        userId = jsonData["user_id"],
        isFinished = jsonData["is_finished"],
        visibility = jsonData["visibility"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "color" : color,
    "userId" : userId,
    "is_finished" : isFinished,
    "visibility" : visibility,
  };

  String id;
  String userId;
  String title;
  bool visibility = false;
  Color color;
  bool isFinished = false;
}
