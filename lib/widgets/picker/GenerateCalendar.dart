class GenerateCalendar {
  static List<DateTime> CALENDAR = <DateTime>[];
  static int todayIndex = 0;
  GenerateCalendar() {
    dayCount();

    todayIndex = (DateTime.now()
            .difference(new DateTime(DateTime.now().year, 1, 1, 0, 0)))
        .inDays;
    for (var i = 1; i <= 12; i++) {
      if ([1, 3, 5, 7, 8, 10, 12].contains(i)) {
        // 31 days
        for (var o = 1; o <= 31; o++) {
          CALENDAR.add(DateTime.utc(DateTime.now().year, i, o));
        }
      } else if (i == 2) {
        if (count == 365) {
          //27 days
          for (var o = 1; o <= 27; o++) {
            CALENDAR.add(DateTime.utc(DateTime.now().year, i, o));
          }
        } else {
          //28days leap year
          for (var o = 1; o <= 28; o++) {
            CALENDAR.add(
              DateTime.utc(DateTime.now().year, i, o),
            );
          }
        }
      } else {
        // 30days
        for (var o = 1; o <= 30; o++) {
          CALENDAR.add(DateTime.utc(DateTime.now().year, i, o));
        }
      }
    }
  }
}

int count = 0;

void dayCount() {
  var year = DateTime.now().year;

  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        count = 366;
      } else {
        count = 365;
      }
    } else {
      count = 366;
    }
  } else {
    count = 365;
  }
}
