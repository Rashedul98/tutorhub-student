import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/models/teachers/response.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';
import 'package:tutorhub/views/teachers/create_tution_loader.dart';
import 'package:tutorhub/views/teachers/providers.dart';

import '../../utilities/colors.dart';
import '../../utilities/functions/navigation.dart';

class TeacherDetailsScreen extends ConsumerWidget {
  final Teachers teacher;
  const TeacherDetailsScreen({super.key, required this.teacher});

  @override
  Widget build(BuildContext context, ref) {
    final reqModel = ref.watch(createTutionRequestModelProvider);
    List<String> subjects = reqModel.subjects ?? [];
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
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: ProRadioButton(
                                mainAxisAlignment: MainAxisAlignment.start,
                                checked: subjects.contains(expertise.subject),
                                title:
                                    "${expertise.subject} (${expertise.scope})",
                                onTap: (_) {
                                  if (subjects.contains(expertise.subject)) {
                                    subjects.remove(expertise.subject);
                                  } else {
                                    if (expertise.subject != null) {
                                      subjects.add(expertise.subject!);
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
          ProButtonBasic(
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
          const ProGap(y: 16)
        ],
      ),
    );
  }
}
