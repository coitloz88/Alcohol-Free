import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:alcohol_free/app/data/services/notification_service/notification_repository.dart';

class NotificationService extends GetxService {
  static NotificationService get to => Get.find<NotificationService>();
  final NotificationRepository _notificationRepository =
      NotificationRepository();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
      'high_importance_channel', //id
      'High Importance Notifications', // title
      description: 'this channel is used for important notifications',
      importance: Importance.max,
      playSound: true);


  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<NotificationService> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _setUpAndroid();

    return this;
  }

  void _setUpAndroid() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  static void requestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  void sampleNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails("channel id", "channel name",
        channelDescription: "channel description",
        importance: Importance.max,
        priority: Priority.max,
        showWhen: false);

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(
        badgeNumber: 1,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
        0, "plain title", "plain body", platformChannelSpecifics,
        payload: "item x");
  }

}
