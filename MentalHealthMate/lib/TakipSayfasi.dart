import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final TextEditingController _controller = TextEditingController();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  String? lastPsychologicalIssue;

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void setReminder(String issue) {
    setState(() {
      lastPsychologicalIssue = issue;
    });
    scheduleAlarm(issue);
  }

  void scheduleAlarm(String issue) async {
    var scheduledNotificationDateTime = DateTime.now().add(Duration(hours: 24));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'reminder_channel',
      'Reminder Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics
    );

    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Hatırlatıcı',
      ' $issue Hissettiğinden bu yana 24 saat geçti',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takip Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (lastPsychologicalIssue != null)
              Text(
                'Son kaydedilen psikolojik rahatsızlık: $lastPsychologicalIssue',
                style: TextStyle(fontSize: 20),
              ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Yaşadığınız psikolojik sıkıntıyı özetleyiniz'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setReminder(_controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hatırlatıcı 24  saat sonrasına kuruldu')),
                );
              },
              child: Text('Hatırlatıcıyı Ayarla'),
            ),
          ],
        ),
      ),
    );
  }
}
