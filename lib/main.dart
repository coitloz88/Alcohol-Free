import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/core/languages/app_localizations.dart';
import 'package:alcohol_free/core/utils/app_initializations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  await initializeProviders();
  await initializeServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alcohol Free',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko'), //Korean
        ],
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
              toolbarHeight: 40.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Image.asset('assets/images/logo_app_bar.png',
                  height: 13, fit: BoxFit.fill),
              actions: <Widget>[
                IconButton(
                  iconSize: 24,
                  icon: const Icon(CupertinoIcons.bell,
                      size: 24.0, color: Colors.black),
                  onPressed: () {},
                ),
              ]),
          body: const BottomNavigator(),
        ));
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = [
    const Text('약속 화면'),
    const Text('일지 화면'),
    const Text('홈 화면'),
    const Text('커뮤니티 화면'),
    const Text('마이 화면'),
    //promisePage(), ... 등으로 .dart 파일 import 후 추가하면 됨
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.rosette, size: 24.0),
                label: AppLocalizations.of(context)!.promise),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.calendar, size: 24.0),
                label: AppLocalizations.of(context)!.diary),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home, size: 24.0),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.personalhotspot, size: 24.0),
                label: AppLocalizations.of(context)!.community),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person, size: 24.0),
                label: AppLocalizations.of(context)!.my)
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
