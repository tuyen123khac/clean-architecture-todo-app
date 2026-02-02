import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatMinute(int minute) {
    final formattedMinute = minute.toString().padLeft(2, '0');
    return formattedMinute;
  }

  /// Format DateTime to ISO 8601 string without microseconds
  /// Format: yyyy-MM-ddTHH:mm:ssZ (e.g., 2025-01-01T00:00:00Z)
  static String toIso8601StringWithoutMicroseconds(DateTime dateTime) {
    final utc = dateTime.toUtc();
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utc);
  }
}

extension DateTimeUtilsExtension on DateTime {
  String get formatMinute {
    return DateFormat('mm').format(this);
  }

  /// Format to ISO 8601 string without microseconds for API requests
  /// Format: yyyy-MM-ddTHH:mm:ssZ (e.g., 2025-01-01T00:00:00Z)
  String get toIso8601StringForApi {
    return DateTimeUtils.toIso8601StringWithoutMicroseconds(this);
  }
}
