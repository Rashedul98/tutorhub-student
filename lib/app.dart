import 'package:flutter/material.dart';
import 'package:tutorhub/login_checker.dart';
import 'package:tutorhub/utilities/nav_service.dart';
import 'package:tutorhub/utilities/singleton.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().globalNavigatorKey,
      title: "TutorHub",
      debugShowCheckedModeBanner: false,
      home: const LoginCheckerScreen(),
    );
  }
}
