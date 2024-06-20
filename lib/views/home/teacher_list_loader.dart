import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/enums.dart';
import 'package:tutorhub/utilities/functions/call_back.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/views/teachers/providers.dart';
import 'package:tutorhub/views/teachers/teacher_list_screen.dart';

import '../../controllers/teacher_list/teacher_list.dart';

class TeacherListLoader extends StatelessWidget {
  const TeacherListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(teacherListProvider);
            if (state.dataState == DataState.initial) {
              ref.read(teacherListProvider.notifier).getTeachers();
            } else if (state.dataState == DataState.loaded) {
              callBackFunction(() {
                pushReplaced(screen: const TeacherListScreen());
                ref.invalidate(teacherListRequestModelProvider);
              });
            } else if (state.dataState == DataState.empty) {
              return ProAlertClassic(
                title: "Oops!",
                message: state.message,
                button1Text: "OK",
                button1Function: () {
                  pop();
                },
              );
            } else if (state.dataState == DataState.error) {
              return ProAlertClassic(
                title: "Oops!",
                message: state.message,
                button1Text: "OK",
                button1Function: () {
                  pop();
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
