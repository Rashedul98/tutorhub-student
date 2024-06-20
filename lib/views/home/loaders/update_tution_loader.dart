import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';

import '../../../controllers/get_tution/get_tution.dart';
import '../../../controllers/update_tution/update_tution.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/functions/call_back.dart';
import '../../../utilities/functions/navigation.dart';

class UpdateTutionLoader extends StatelessWidget {
  const UpdateTutionLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(updateTutionProvider);

            if (state.dataState == DataState.initial) {
              ref.read(updateTutionProvider.notifier).update();
            } else if (state.dataState == DataState.loaded) {
              return ProAlertClassic(
                title: "Success!",
                message: "Payment completed.",
                button1Text: "OK",
                button1Function: () {
                  callBackFunction(() {
                    pop();
                    ref.read(getTutionProvider.notifier).reset();
                  });
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
