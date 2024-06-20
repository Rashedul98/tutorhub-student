import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/controllers/teacher_list/teacher_list.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/views/teachers/teacher_details_screen.dart';

import '../../models/teachers/response.dart';
import 'map.dart';
import 'providers.dart';

class TeacherListScreen extends ConsumerWidget {
  const TeacherListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<Teachers>? teachers = ref.watch(teacherListProvider).data!.teachers;
    return Scaffold(
      backgroundColor: ProjectColors.grey200,
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
          text: "Teachers",
          color: ProjectColors.white,
          fontSize: 18,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: teachers!.length,
        itemBuilder: (context, index) {
          Teachers teacher = teachers[index];
          return ProTapper(
            onTap: () {
              ref.invalidate(createTutionRequestModelProvider);
              push(screen: TeacherDetailsScreen(teacher: teacher));
            },
            child: ProCard(
              disableShadow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ProText(
                          text: "${teacher.firstName} ${teacher.lastName}",
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ProTapper(
                        child: const Row(
                          children: [
                            ProText(
                              text: "Map",
                            ),
                            ProGap(x: 4),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                        onTap: () {
                          push(
                            screen: TeachersLocationMap(
                              lat: teacher.location!.latitude!,
                              long: teacher.location!.longitude!,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const ProGap(y: 8),
                  ProText(
                    text: "${teacher.phone} | ${teacher.email}",
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
