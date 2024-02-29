
enum Repeat { Daily, Weekly, Monthly }
class Routine {
  Routine(
    this.autoAdd,
    this.repeat, {
    required this.id,
    required this.goalId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.time,
  });

  Routine.from(Map<String, dynamic> jsonData)
      : id = jsonData["id"],
        title = jsonData["title"],
        goalId = jsonData["goal_id"],
        // 시간, 날자를 문자열로 받아와서 DateTime에 맞게 변환 필요
        startDate = jsonData["startDate"],
        endDate = jsonData["endDate"],
        time = jsonData["time"],
        repeat = jsonData["repeat"],
        autoAdd = jsonData["add_auto"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "goal_id" : goalId,
    "start_date" : startDate,
    "end_date" : endDate,
    "time" : time,
    "repeat" : repeat,
    "add_auto" : autoAdd,
  };

  String id;
  String goalId;
  String title;
  DateTime startDate;
  DateTime endDate;
  DateTime time;
  Repeat repeat = Repeat.Daily;
  bool autoAdd = true;
}
