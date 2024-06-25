import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/widgets/alert.dart';
import 'package:tutorhub/controllers/signup/signup.dart';
import 'package:tutorhub/utilities/enums.dart';
import 'package:tutorhub/utilities/functions/call_back.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';

import 'package:tutorhub/views/signin/signin.dart';

class SignupLoader extends StatelessWidget {
  const SignupLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(signupProvider);

            if (state.dataState == DataState.initial) {
              ref.read(signupProvider.notifier).signUp();
            } else if (state.dataState == DataState.loaded) {
              callBackFunction(() {
                pop();
                pushReplaced(screen: const SigninScreen());
              });
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
