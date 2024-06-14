import 'package:flutter/material.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/home/searchpad.dart';
import 'package:tutorhub/views/home/tutions.dart';
import 'package:tutorhub/views/signin/signin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ProjectColors.primary,
          title: const ProText(
            text: "TutorHub",
            fontSize: 18,
            color: Colors.white,
          ),
          actions: [
            ProTapper(
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.logout,
                color: ProjectColors.white,
              ),
              onTap: () {
                locator<SharedPreferenceService>().clear().then((value) {
                  pushAndRemoveAll(screen: const SigninScreen());
                });
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSearchpad(),
                ProGap(y: 16),
                HomeTutionList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
