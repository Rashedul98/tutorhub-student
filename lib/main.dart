import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/app.dart';
import 'package:tutorhub/utilities/dio.dart';
import 'package:tutorhub/utilities/singleton.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await registerSingletons();
  await locator<DioService>().create("http://localhost:3000");

  runApp(const ProviderScope(child: MyApp()));
}
