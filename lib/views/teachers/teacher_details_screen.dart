import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/models/teachers/create_tution_request.dart';
import 'package:tutorhub/models/teachers/response.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/teachers/create_tution_loader.dart';
import 'package:tutorhub/views/teachers/providers.dart';

import '../../utilities/colors.dart';
import '../../utilities/functions/navigation.dart';

class TeacherDetailsScreen extends ConsumerWidget {
  const TeacherDetailsScreen({super.key, required this.teacher});
  final Teachers teacher;

  @override
  Widget build(BuildContext context, ref) {
    final reqModel = ref.watch(createTutionRequestModelProvider);
    List<Subjects> subjects = reqModel.subjects ?? [];
    return Scaffold(
      backgroundColor: ProjectColors.background,
      appBar: AppBar(
        backgroundColor: ProjectColors.primary,
        leading: ProTapper(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            pop();
          },
        ),
        title: const ProText(
          text: "Teacher Details",
          color: ProjectColors.white,
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProText(
                    text: "Select Subjects",
                    fontSize: 14,
                  ),
                  const ProGap(y: 16),
                  teacher.expertise != null
                      ? Column(
                          children: teacher.expertise!.map((expertise) {
                            bool isSelected = false;
                            for (var element in subjects) {
                              if (element.subject == expertise.subject &&
                                  element.scope == expertise.scope) {
                                isSelected = true;
                                break;
                              }
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: ProRadioButton(
                                mainAxisAlignment: MainAxisAlignment.start,
                                checked: isSelected,
                                title:
                                    "${expertise.subject} (${expertise.scope})",
                                onTap: (_) {
                                  if (isSelected) {
                                    subjects.removeWhere(
                                      (element) {
                                        return element.subject ==
                                                expertise.subject &&
                                            element.scope == expertise.scope;
                                      },
                                    );
                                  } else {
                                    if (expertise.subject != null) {
                                      subjects.add(Subjects(
                                        subject: expertise.subject,
                                        scope: expertise.scope,
                                      ));
                                    }
                                  }
                                  ref
                                      .read(createTutionRequestModelProvider
                                          .notifier)
                                      .update((state) =>
                                          state.copyWith(subjects: subjects));
                                },
                              ),
                            );
                          }).toList(),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProButtonBasic(
              height: 40,
              text: "Send Request",
              width: double.infinity,
              backgroundColor: ProjectColors.primary,
              onTap: () async {
                String? studentEmail = await locator<SharedPreferenceService>()
                    .getString(key: "userEmail");
                ref.read(createTutionRequestModelProvider.notifier).update(
                      (state) => state.copyWith(
                        teacherEmail: teacher.email,
                        studentEmail: studentEmail,
                        status: "requested",
                      ),
                    );

                loader(screen: const CreateTutionLoader());
              },
            ),
          ),
          const ProGap(y: 16)
        ],
      ),
    );
  }
}
