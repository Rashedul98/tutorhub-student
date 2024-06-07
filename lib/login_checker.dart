import 'package:flutter/material.dart';
import 'package:tutorhub/utilities/functions/middlewear.dart';

class LoginCheckerScreen extends StatefulWidget {
  const LoginCheckerScreen({super.key});

  @override
  State<LoginCheckerScreen> createState() => _LoginCheckerScreenState();
}

class _LoginCheckerScreenState extends State<LoginCheckerScreen> {
  @override
  void initState() {
    rootMiddlewear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
