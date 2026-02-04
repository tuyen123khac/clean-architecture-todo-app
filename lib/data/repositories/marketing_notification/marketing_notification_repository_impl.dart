import 'dart:async';
import 'dart:math';

import '../../../domain/entities/notification/notification_entity.dart';
import '../../../domain/repositories/marketing_notification/marketing_notification_repository.dart';
import '../../data_source/local/mock/marketing_notification_mock_data.dart';

class MarketingNotificationRepositoryImpl
    implements MarketingNotificationRepository {
  final MarketingNotificationMockData _mockData;

  final _notificationController = StreamController<NotificationEntity>.broadcast();
  Timer? _schedulerTimer;
  int _notificationCount = 0;

  MarketingNotificationRepositoryImpl(this._mockData);

  @override
  Stream<NotificationEntity> watchNotifications() {
    return _notificationController.stream;
  }

  @override
  void startScheduler() {
    _scheduleNextNotification();
  }

  @override
  void stopScheduler() {
    _schedulerTimer?.cancel();
    _schedulerTimer = null;
  }

  void _scheduleNextNotification() {
    // First 2 notifications: every 1 minute
    // After that: every 5 minutes
    final interval = _notificationCount < 2
        ? const Duration(minutes: 1)
        : const Duration(minutes: 5);

    _schedulerTimer?.cancel();
    _schedulerTimer = Timer(interval, () {
      _emitNotification();
      _scheduleNextNotification();
    });
  }

  void _emitNotification() {
    final random = Random();
    final templates = _mockData.getMarketingTemplates();
    final template = templates[random.nextInt(templates.length)];

    final notification = NotificationEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: template['title']!,
      body: template['body']!,
      createdAt: DateTime.now(),
    );

    // Emit to stream (UI layer will handle showing system notification)
    _notificationController.add(notification);

    _notificationCount++;
  }

  void dispose() {
    stopScheduler();
    _notificationController.close();
  }
}
