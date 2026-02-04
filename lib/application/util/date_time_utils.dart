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

  /// Format DateTime to relative time string (e.g., "Just now", "5m ago")
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
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

  /// Format to relative time string (e.g., "Just now", "5m ago")
  String get toRelativeTime {
    return DateTimeUtils.formatRelativeTime(this);
  }
}
