import 'package:flutter/material.dart';
import 'package:jovajovajova/jobpage/screen/job_screen.dart';
import 'package:jovajovajova/login_screen.dart';
import 'package:jovajovajova/mainpage/screen/main_screen.dart';
import 'package:jovajovajova/myprofile_page/screen/myprofile_screen.dart';
import 'package:jovajovajova/screens/notification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString('accessToken');

  runApp(MyApp(accessToken: accessToken));
}

class MyApp extends StatelessWidget {
  final String? accessToken;

  const MyApp({Key? key, this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: accessToken != null ? '/home' : '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Main(),
      },
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _index = 0;

  final List<Widget> _pages = [
    MainScreen(),
    JobScreen(),
    MyprofileScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "구인구직"),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "공지"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "마이페이지"),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
