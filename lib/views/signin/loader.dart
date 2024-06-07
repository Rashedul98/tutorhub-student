import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/enums.dart';
import 'package:tutorhub/utilities/functions/call_back.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/views/home/home.dart';

import '../../controllers/signin/signin.dart';

class SigninLoader extends StatelessWidget {
  const SigninLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(signinProvider);

            if (state.dataState == DataState.initial) {
              ref.read(signinProvider.notifier).signIn();
            } else if (state.dataState == DataState.loaded) {
              callBackFunction(() {
                pop();
                pushReplaced(screen: HomeScreen());
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
