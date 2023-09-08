import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {

  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS, macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  final AndroidNotificationDetails _androidNotificationDetails = const AndroidNotificationDetails(
    'chat_message',
    'channel name',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotifications({required String title}) async {
    print('notification');
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      "This is the Notification Body!",
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> scheduleNotifications(
   //required int id,
    // required String title,
    // required String body,
    // required DateTime selectedDate,
  ) async {
    // print(selectedDate);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'title',
        'sdf',
         tz.TZDateTime.now(tz.getLocation('Asia/Bangkok')).add(const Duration(seconds: 3)),
        // tz.TZDateTime(
        //   tz.getLocation('Asia/Bangkok'),
        //   selectedDate.year,
        //   selectedDate.month,
        //   selectedDate.day,
        //   selectedDate.hour,
        //   selectedDate.minute,
        // ),
        NotificationDetails(
          android: _androidNotificationDetails,
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> getAllNotifications() async {
    var x = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (var el in x) {
      print("id:${el.id}, title:${el.title}, body:${el.body}");
    }
  }
}