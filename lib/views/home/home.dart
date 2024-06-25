import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/controllers/get_tution/get_tution.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/home/loaders/profile.dart';
import 'package:tutorhub/views/home/searchpad.dart';
import 'package:tutorhub/views/home/tutions.dart';
import 'package:tutorhub/views/signin/signin.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
                Icons.person,
                color: ProjectColors.white,
              ),
              onTap: () {
                proBottomSheet(
                  context: context,
                  appBarTitle: "Profile",
                  onAppBarCloseIconTap: () {
                    pop();
                  },
                  sheetBody: const ProfileBottomSheet(),
                );
              },
            ),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(getTutionProvider.notifier).reset();
              },
              child: ListView(
                children: const [
                  HomeSearchpad(),
                  ProGap(y: 16),
                  HomeTutionList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
