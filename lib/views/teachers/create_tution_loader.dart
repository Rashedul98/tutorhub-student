import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/controllers/create_tution/create_tution.dart';
import 'package:tutorhub/utilities/enums.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';

class CreateTutionLoader extends StatelessWidget {
  const CreateTutionLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(createTutionProvider);

            if (state.dataState == DataState.initial) {
              ref.read(createTutionProvider.notifier).create();
            } else if (state.dataState == DataState.loaded) {
              return ProAlertClassic(
                title: "Success!",
                message:
                    "Tution request has been sent. Please wait for approval from teacher.",
                button1Text: "OK",
                button1Function: () {
                  pop();
                  pop();
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
