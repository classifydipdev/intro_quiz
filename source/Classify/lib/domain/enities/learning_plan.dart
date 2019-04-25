class LearningPlan{
  List<String> subjects = List();

  int lessonDuration;

  int hoursStart;

  int minutesStart;

  int hoursFinish;

  int minutesFinish;

  Map<String, List<String>> dailySubjects = Map();

  LearningPlan fromJson(Map<dynamic, dynamic> raw) {
    Map<String, dynamic> json = Map<String, dynamic>.from(raw);

    if (json['subjects'] != null) subjects = json['subjects'];

    if (json['lessonDuration'] != null) lessonDuration = json['lessonDuration'];

    if (json['hoursStart'] != null) hoursStart = json['hoursStart'];

    if (json['minutesStart'] != null) minutesStart = json['minutesStart'];

    if (json['hoursFinish'] != null) hoursFinish = json['hoursFinish'];

    if (json['minutesFinish'] != null) minutesFinish = json['minutesFinish'];

    if (json['dailySubjects'] != null) dailySubjects = json['dailySubjects'];

    return this;
  }

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();

    if (subjects != null) json.putIfAbsent('subjects', () => subjects);

    if (lessonDuration != null) json.putIfAbsent('lessonDuration', () => lessonDuration);

    if (hoursStart != null) json.putIfAbsent('hoursStart', () => hoursStart);

    if (minutesStart != null) json.putIfAbsent('minutesStart', () => minutesStart);

    if (hoursFinish != null) json.putIfAbsent('hoursFinish', () => hoursFinish);

    if (minutesFinish != null) json.putIfAbsent('minutesFinish', () => minutesFinish);

    if (dailySubjects != null) json.putIfAbsent('dailySubjects', () => dailySubjects);

    return json;
  }
}