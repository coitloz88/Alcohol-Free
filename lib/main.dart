import 'package:alcohol_free/app/data/providers/auth_provider.dart';
import 'package:alcohol_free/core/languages/app_localizations.dart';
import 'package:alcohol_free/core/utils/app_initializations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      home: BottomNavigator(),
    );
  }
}

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key});

  final List<Widget> _widgetOptions = [
    const Text('약속 화면'),
    const Text('일지 화면'),
    const Text('홈 화면'),
    const Text('커뮤니티 화면'),
    const Text('마이 화면'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 5,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Color(0xffE2E2E2), width: 1.0))),
          child: TabBar(
            tabs: <Widget>[
              Tab(icon: Text(AppLocalizations.of(context)!.promise)),
              Tab(icon: Text(AppLocalizations.of(context)!.diary)),
              Tab(icon: Text(AppLocalizations.of(context)!.home)),
              Tab(icon: Text(AppLocalizations.of(context)!.community)),
              Tab(icon: Text(AppLocalizations.of(context)!.my))
            ],
            indicatorColor: Colors.transparent,
            unselectedLabelStyle: const TextStyle(
                color: Color(0xffE2E2E2), fontWeight: FontWeight.normal),
            labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: _widgetOptions,
        ),
      ),
    );
  }
}
