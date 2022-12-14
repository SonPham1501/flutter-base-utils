// ignore_for_file: file_names

import 'package:intl/intl.dart';

class DateTimeUtil {
  static String? dateTimeToString(DateTime? dateTime, String format) {
    if (dateTime == null) return null;
    var formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static DateTime? stringToDateTime(String? dateTimeString, String format) {
    if (dateTimeString == null) return null;
    var formatter = DateFormat(format);
    return formatter.parse(dateTimeString);
  }

  static DateTime getDateTimeLaterYear(DateTime dateTime, int value) {
    return DateTime(dateTime.year + value, dateTime.month, dateTime.day);
  }

  static DateTime getDateTimeLaterMinute(DateTime dateTime, int value) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute + value);
  }

  static DateTime getDateTimeLaterHour(DateTime dateTime, int value) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour + value);
  }

  static DateTime getDateTimeLaterDay(DateTime dateTime, int value) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day + value);
  }

  static DateTime getDateTimeLaterMonth(DateTime dateTime, int value) {
    return DateTime(dateTime.year, dateTime.month + value, dateTime.day);
  }

  static String? getDateShowWithString(String? dateTime) {
    if (dateTime == null) return '';
    var dt = DateTime.tryParse(dateTime);
    if (dt == null) return '';
    return dateTimeToString(dt, "dd/MM/yyyy");
  }

  static String? getDateTimeShowWithString(String? dateTime) {
    if (dateTime == null) return '';
    var dt = DateTime.tryParse(dateTime);
    if (dt == null) return '';
    return dateTimeToString(dt, "HH:mm dd/MM/yyyy");
  }

  static String? getDateTimeServerToDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    return dateTimeToString(dateTime, "yyyy-MM-dd'T'HH:mm:ss.SSS");
  }

  static String? getDateTimeSendServer(String dateTimeString) {
    var dateTime = stringToDateTime(dateTimeString, "HH:mm dd-MM-yyyy");
    return dateTimeToString(dateTime, "yyyy-MM-dd'T'HH:mm:ss.SSS");
  }

  static String? getDateTimeStringServer(DateTime dateTime) {
    return dateTimeToString(dateTime, "yyyy-MM-dd'T'HH:mm:ss");
  }

  static String? getDateTimePayment(DateTime dateTime, {int hour = 0}) {
    dateTime = dateTime.subtract(Duration(hours: hour));
    return dateTimeToString(dateTime, "dd/MM/yyyy' 'HH:mm");
  }

  static String? getDateTimeInteractive(DateTime? dateTime) {
    if (dateTime == null) return '';
    return ' (${dateTimeToString(dateTime, "HH:mm '-' dd/MM/yyyy") ?? ""})';
  }

  static String? getDateTimeStamp(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return dateTimeToString(dateTime, "dd/MM/yyyy");
  }

  static String? getDateTimeToDate(DateTime? dateTime) {
    if (dateTime == null) return "";
    return dateTimeToString(dateTime, "dd/MM/yyyy");
  }

  static String? getDateTimeFormat(DateTime? dateTime, String format) {
    if (dateTime == null) return null;
    return dateTimeToString(dateTime, format);
  }

  static String? getDateTimeTHG(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return "";
    var dateTime = stringToDateTime(dateTimeString, "yyyy-MM-dd'T'HH:mm:ss");
    return getFullDate(dateTime);
  }

  static String? getFullDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.day} thg ${dateTime.month}, ${dateTime.year}";
  }

  static String? getFullDateAndTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}";
  }

  static String? getFullDateAndTimeSecond(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  }

  static String getFullTime(DateTime dateTime) {
    return "${dateTime.hour} : ${dateTime.minute}";
  }

  static String? getFullDateTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.day} thg ${dateTime.month}, ${dateTime.year}, ${dateTimeToString(dateTime, "HH:mm:ss")!}";
  }

  static DateTime getDateTimeStartDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0, 0);
  }

  static DateTime getDateTimeEndDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 0, 0);
  }

  static int getTimeStamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  static bool isSameDate(DateTime? date1, DateTime? date2) {
    if (date1 == null && date2 == null) {
      return true;
    }
    if (date1 == null || date2 == null) {
      return false;
    }
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static int isSameOnlyHourAndMinute(DateTime? date1, DateTime? date2) {
    if (date1 == null && date2 == null) {
      return 0;
    }
    if (date1 == null || date2 == null) {
      return 0;
    }
    if (date1.hour > date2.hour) {
      return 1;
    }
    if (date1.hour < date2.hour) {
      return -1;
    }
    if (date1.minute > date2.minute) {
      return 1;
    }
    if (date1.minute < date2.minute) {
      return -1;
    }
    return 0;
  }

  static int compareOnlyDay(DateTime? date1, DateTime? date2) {
    if (date1 == null && date2 == null) {
      return 0;
    }
    if (date1 == null || date2 == null) {
      return 0;
    }
    return getDateTimeStartDay(date1).difference(getDateTimeStartDay(date2)).inDays;
  }

  static String getTimeMinuteFromSecond(int second) {
    final duration = Duration(seconds: second);
    var seconds = duration.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d ');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h ');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m ');
    }
    if (seconds != 0) {
      tokens.add('${seconds}s ');
    }
    if (tokens.isEmpty) {
      tokens.add('${seconds}s ');
    }
    //x??? l?? n???u gi?? tr??? cu???i l?? 0 th?? b??? ??i
    //VD 1h0p th?? remove 0p ??i
    if (tokens.length >= 2) {
      if (tokens.last == "0s") {
        tokens.removeLast();
      }
      if (tokens.last.trim() == "0m") {
        tokens.removeLast();
      }
      if (tokens.last.trim() == "0h") {
        tokens.removeLast();
      }
      if (tokens.last.trim() == "0d") {
        tokens.removeLast();
      }
    }

    return tokens.join('');
  }

  static String getTimeMinuteFromSecondVN(int second) {
    var value = getTimeMinuteFromSecond(second);
    value = value.replaceAll("d", " ng??y");
    value = value.replaceAll("h", " gi???");
    value = value.replaceAll("m", " ph??t");
    value = value.replaceAll("s", " gi??y");
    return value.trim();
  }

  static String getTimeInSecond(int second) {
    var duration = Duration(seconds: second);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1, 0);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    final date = month.month < 12 ? DateTime.utc(month.year, month.month + 1, 1, 24) : DateTime.utc(month.year + 1, 1, 1, 24);
    return date.subtract(const Duration(days: 1));
  }

  static DateTime findFirstDateOfTheWeek(DateTime dateTime, {int offset = 1}) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
      time = "H??m nay";
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} Ng??y tr?????c';
      } else {
        time = '${diff.inDays} Ng??y tr?????c';
      }
    } else if (diff.inDays > 365) {
      // return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
      time = "${(diff.inDays / 365).floor()} inday ${diff.inDays}";
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} Tu???n tr?????c';
      } else {
        time = '${(diff.inDays / 7).floor()} Tu???n tr?????c';
      }
    }

    return time;
  }

  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'ph??t';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'gi???';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'ng??y';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'tu???n';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'th??ng';
    } else {
      timeValue = (diffInHours / (24 * 365)).round();
      timeUnit = 'n??m';
    }

    timeAgo = '$timeValue $timeUnit';
    timeAgo += timeValue > 1 ? '' : '';

    return '$timeAgo tr?????c';
  }

  static String displayTimeAgoFromTimestampMonth(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'ph??t';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'gi???';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'ng??y';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'tu???n';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'th??ng';
      return "${getDateTimeToDate(videoDate)}";
    } else {
      timeValue = (diffInHours / (24 * 365)).round();
      timeUnit = 'n??m';
      return "${getDateTimeToDate(videoDate)}";
    }

    timeAgo = '$timeValue $timeUnit';
    timeAgo += timeValue > 1 ? '' : '';

    return '$timeAgo tr?????c';
  }
}
