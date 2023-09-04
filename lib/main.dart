import 'package:flutter/material.dart';
import 'list.dart';
import 'live.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the awesome_notifications plugin
  AwesomeNotifications().initialize(
    'resource://drawable/ic_launcher', // Replace with your app's launcher icon resource URL
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
  );

  // Request permissions for notifications (you can customize this)
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCREENING FINAL APP',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageUrls = [
    'https://i.ytimg.com/vi/AItL5pCDFGw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/IfPfKebBqUU/maxresdefault.jpg',
    'https://i.ytimg.com/vi/FunWpyUcEbs/maxresdefault.jpg',
    'https://img.youtube.com/vi/3CxaOme3uWA/hqdefault.jpg',
    'https://img.youtube.com/vi/ORb8kFvDsbU/hqdefault.jpg',
  ];
  int currentIndex = 0;

  void nextImage() {
    if (mounted) {
      setState(() {
        currentIndex = (currentIndex + 1) % imageUrls.length;
      });
    }
  }

  Future<void> sendNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: 'Notification Title',
        body: 'This is the notification body.',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs (including the "It is Live" tab)
      child: Scaffold(
        appBar: AppBar(
          title: Text('SCREENING FINAL APP'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Main Page'),
              Tab(text: 'List Page'),
              Tab(text: 'It is Live'), // Add the "It is Live" tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Main Page Content
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      imageUrls[currentIndex],
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: nextImage,
                  child: Text('Next Image'),
                ),
                ElevatedButton(
                  onPressed: () {
                    sendNotification();
                  },
                  child: Text('Send Notification'),
                ),
              ],
            ),

            // List Page Content
            ListPage(),

            // It is Live Page Content
            LivePage(),
          ],
        ),
      ),
    );
  }
}
