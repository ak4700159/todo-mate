import 'dart:ui';

class Todo {
  Todo(
      {required this.id,
      required this.routineId,
      required this.goalId,
      required this.memo,
      required this.imageData,
      required this.createdDatetime,
      required this.alarmDatetime,
      required this.description,
      required this.date});

  Todo.from(Map<String, dynamic> jsonData)
      : id = jsonData["id"],
        goalId = jsonData["goal_id"],
        routineId = jsonData["routine_id"],
        description = jsonData["description"],
        memo = jsonData["memo"],
        date = jsonData["date"],
        alarmDatetime = jsonData["alarm_datetime"],
        createdDatetime = jsonData["created_datetime"],
        imageData = jsonData["image_data"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "goal_id": goalId,
        "routine_id": routineId,
        "description": description,
        "memo": memo,
        "date": date,
        "alarm_datetime": alarmDatetime,
        "created_datetime": createdDatetime,
        "image_data": imageData,
      };

  String id;
  String goalId;
  String routineId;
  String description;
  String memo;
  DateTime date;
  DateTime alarmDatetime;
  DateTime createdDatetime;
  Image imageData;
}
