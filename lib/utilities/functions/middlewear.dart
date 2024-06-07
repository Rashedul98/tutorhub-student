import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/home/home.dart';
import 'package:tutorhub/views/signin/signin.dart';

rootMiddlewear() async {
  final bool? isLoggedIn =
      await locator<SharedPreferenceService>().getBool(key: "loggedIn");
  if (isLoggedIn == true) {
    pushReplaced(screen: HomeScreen());
  } else {
    pushReplaced(screen: const SigninScreen());
  }
}
