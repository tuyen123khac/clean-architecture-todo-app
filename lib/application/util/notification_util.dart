import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../presentation/navigation/app_navigation.dart';
import '../../presentation/navigation/app_routes.dart';

/// Notification channel IDs for different notification types
class NotificationChannels {
  static const String marketing = 'marketing_channel';
  // Add more channels here for future notification types
  // static const String order = 'order_channel';
  // static const String chat = 'chat_channel';
}

class NotificationUtil {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get plugin => _notificationsPlugin;

  /// Initialize notifications
  static Future<void> initialize() async {
    await _notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
      onDidReceiveNotificationResponse: _handleNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _handleBackgroundNotificationTap,
    );
  }

  static void _handleNotificationTap(NotificationResponse response) {
    final route = _getRouteForNotification(response);
    if (route != null) {
      _navigateTo(route);
    }
  }

  @pragma('vm:entry-point')
  static void _handleBackgroundNotificationTap(NotificationResponse response) {
    // Background tap handling - the app will be launched
    // and the callback will be called in foreground
  }

  /// Determine which route to navigate based on notification data
  static String? _getRouteForNotification(NotificationResponse response) {
    // Check payload first for specific routing
    final payload = response.payload;
    if (payload != null && payload.isNotEmpty) {
      return _getRouteFromPayload(payload);
    }

    // Fallback to channel-based routing for Android
    // For now, all marketing notifications go to notification screen
    return AppRoutes.notification;
  }

  /// Parse payload to determine route
  /// Payload format: "route:/notification" or "route:/jewelryDetail?id=123"
  static String? _getRouteFromPayload(String payload) {
    if (payload.startsWith('route:')) {
      return payload.substring(6); // Remove 'route:' prefix
    }
    // Default to notification screen if payload doesn't specify route
    return AppRoutes.notification;
  }

  /// Navigate to the specified route
  static void _navigateTo(String route) {
    final navigator = AppNavigation.navigatorKey.currentState;
    if (navigator != null) {
      // Parse route and arguments if needed
      final uri = Uri.tryParse(route);
      if (uri != null && uri.queryParameters.isNotEmpty) {
        navigator.pushNamed(uri.path, arguments: uri.queryParameters);
      } else {
        navigator.pushNamed(route);
      }
    }
  }

  /// Request notification permissions for iOS and Android
  static Future<void> requestPermissions() async {
    // iOS
    final iosPlugin = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    if (iosPlugin != null) {
      await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    // Android (Android 13+ needs POST_NOTIFICATIONS)
    final androidPlugin = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
  }

  /// Show a local notification
  ///
  /// [payload] can be used to pass routing info, e.g., "route:/notification"
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String channelId = NotificationChannels.marketing,
    String channelName = 'Marketing Notifications',
    String channelDescription = 'Promotional offers and updates',
    String? payload,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/launcher_icon',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.show(id, title, body, details, payload: payload);
  }
}
