import 'package:get_it/get_it.dart';
import 'package:tutorhub/utilities/dio.dart';
import 'package:tutorhub/utilities/nav_service.dart';
import 'package:tutorhub/utilities/shared_preference.dart';

GetIt locator = GetIt.instance;

Future<void> registerSingletons() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SharedPreferenceService());
  locator.registerLazySingleton(() => DioService());
}
