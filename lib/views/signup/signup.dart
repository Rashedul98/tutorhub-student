import 'package:flutter/material.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/views/signin/signin.dart';

import '../../utilities/functions/navigation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "First name",
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "Last name",
                  ),
                  const ProGap(y: 16),
                  const ProText(
                    text: 'Select gender',
                  ),
                  const ProGap(y: 8),
                  const Row(
                    children: [
                      ProRadioButton(
                        title: "Male",
                      ),
                      ProGap(x: 16),
                      ProRadioButton(
                        title: "Female",
                      ),
                    ],
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "Email",
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "School name",
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "College name",
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "Address",
                  ),
                  const ProGap(y: 16),
                  const ProTextFormField(
                    borderColor: Colors.black12,
                    borderWidth: 1,
                    hint: "Password",
                  ),
                  const ProGap(y: 16),
                  ProButtonBasic(
                    text: "Sign up",
                    fontSize: 16,
                    height: 45,
                    width: double.infinity,
                    onTap: () {},
                  ),
                  const ProGap(y: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ProText(
                        text: "Already have account?",
                        fontSize: 14,
                      ),
                      ProButtonText(
                        text: "Sign in",
                        fontColor: Colors.blue,
                        function: () {
                          pushReplaced(screen: const SigninScreen());
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
