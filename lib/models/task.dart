class Task {
  Task({required this.title, required this.dateTime});

  String title;
  DateTime dateTime;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.title == title && other.dateTime == dateTime;
  }

  @override
  int get hashCode => title.hashCode ^ dateTime.hashCode;
}


