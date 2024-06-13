import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/enums.dart';
import 'package:tutorhub/utilities/functions/get_position.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/home/teacher_list_loader.dart';
import 'package:tutorhub/views/signin/signin.dart';
import 'package:tutorhub/views/teachers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String? userName;

  getUserData() async {
    userName =
        await locator<SharedPreferenceService>().getString(key: "userName");
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reqModel = ref.watch(teacherListRequestModelProvider);

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProText(
                  text: "Welcome $userName",
                  fontSize: 14,
                ),
                const ProGap(y: 16),
                ProCard(
                  disableShadow: true,
                  width: double.infinity,
                  backgroundColor: ProjectColors.grey200,
                  borderRadius: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProText(
                        text: "Looking for tutors?",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ProjectColors.primary,
                      ),
                      const ProGap(y: 8),
                      const ProText(
                        text: "Find tutors which you learn from conviently!",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ProjectColors.primary,
                      ),
                      const ProGap(y: 12),
                      ProTextField(
                        controller: controller,
                        height: 40,
                        hint: "Enter Subjects (Ex. English, ICT)",
                        hintFontSize: 14,
                        fontSize: 14,
                        textInputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[A-Z a-z,0-9]"),
                          ),
                        ],
                        textInputAction: TextInputAction.done,
                      ),
                      const ProGap(y: 12),
                      ProRadioButton(
                        checked:
                            reqModel.scope == ScopeType.primarySchool.value,
                        title: ScopeType.primarySchool.name,
                        titleFontSize: 12,
                        titleColor: ProjectColors.primary,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: (_) {
                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update((state) => state.copyWith(
                                    scope: ScopeType.primarySchool.value,
                                  ));
                        },
                      ),
                      const ProGap(y: 4),
                      ProRadioButton(
                        checked: reqModel.scope == ScopeType.highSchool.value,
                        title: ScopeType.highSchool.name,
                        titleFontSize: 12,
                        titleColor: ProjectColors.primary,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: (_) {
                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update((state) => state.copyWith(
                                    scope: ScopeType.highSchool.value,
                                  ));
                        },
                      ),
                      const ProGap(y: 4),
                      ProRadioButton(
                        checked: reqModel.scope == ScopeType.college.value,
                        title: ScopeType.college.name,
                        titleFontSize: 12,
                        titleColor: ProjectColors.primary,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: (_) {
                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update((state) => state.copyWith(
                                    scope: ScopeType.college.value,
                                  ));
                        },
                      ),
                      const ProGap(y: 4),
                      ProRadioButton(
                        checked: reqModel.scope == ScopeType.oLevel.value,
                        title: ScopeType.oLevel.name,
                        titleFontSize: 12,
                        titleColor: ProjectColors.primary,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: (_) {
                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update((state) => state.copyWith(
                                    scope: ScopeType.oLevel.value,
                                  ));
                        },
                      ),
                      const ProGap(y: 4),
                      ProRadioButton(
                        checked: reqModel.scope == ScopeType.aLevel.value,
                        title: ScopeType.aLevel.name,
                        titleFontSize: 12,
                        titleColor: ProjectColors.primary,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: (_) {
                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update((state) => state.copyWith(
                                    scope: ScopeType.aLevel.value,
                                  ));
                        },
                      ),
                      const ProGap(y: 12),
                      ProButtonBasic(
                        text: "See Tutors",
                        fontColor: ProjectColors.primary,
                        fontSize: 12,
                        borderRadius: 6,
                        backgroundColor: Colors.white,
                        height: 32,
                        onTap: () async {
                          List<String>? subjects = [];
                          List<String>? subjectsTemp =
                              controller.text.toString().split(',');

                          for (var element in subjectsTemp) {
                            subjects.add(element.trim());
                          }

                          Position position = await getCurrentPosition();

                          ref
                              .read(teacherListRequestModelProvider.notifier)
                              .update(
                                (state) => state.copyWith(
                                  subject: subjects,
                                  latitude: position.latitude,
                                  longitude: position.longitude,
                                ),
                              );
                          loader(screen: const TeacherListLoader());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
