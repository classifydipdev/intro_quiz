class Utility {

  static String getDateRange(DateTime date) {
    String dateRange = '';
    DateTime currentDate = DateTime.now();
    int differenceDays = date.difference(currentDate).inDays;

    if (differenceDays.abs() < 2) {
      switch (differenceDays) {
        case 1:
          dateRange = "Tomorrow";
          break;
        case 0:
          DateTime checkDate = currentDate.add(Duration(days: 1));
          if (checkDate.day == date.day)
            dateRange = "Tomorrow";
          else
            dateRange = "Today";
          break;
        case 1:
          dateRange = "Yesterday";
          break;
        default:
      }
    } else {
      dateRange = "${(differenceDays.abs() + 1)} days";
      if (differenceDays < 0) dateRange += " ago";
    }
    return dateRange;
  }
}
