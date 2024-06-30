import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/utilities/functions/null_checker.dart';
import 'package:tutorhub/views/signin/loader.dart';
import 'package:tutorhub/views/signin/providers.dart';
import 'package:tutorhub/views/signup/signup.dart';

import '../../utilities/functions/email_validator.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Consumer(
              builder: (context, ref, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IntrinsicWidth(
                          child: Row(
                            children: [
                              ProText(
                                text: "Tutor",
                                fontSize: 24,
                                color: ProjectColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              ProText(
                                text: "Hub",
                                fontSize: 24,
                                color: ProjectColors.blue500,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        ProText(
                          text: "Students",
                          fontSize: 14,
                          color: ProjectColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const ProGap(y: 24),
                    ProTextFormField(
                      borderColor: Colors.black12,
                      borderWidth: 1,
                      hint: "Email",
                      onChanged: (value) {
                        ref
                            .read(signinRequestModelProvider.notifier)
                            .update((state) => state.copyWith(email: value));
                      },
                      validator: (value) {
                        if (isNull(value)) {
                          return 'This field can not be empty';
                        } else if (!isEmailValid(value)) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const ProGap(y: 16),
                    ProTextFormField(
                      borderColor: Colors.black12,
                      borderWidth: 1,
                      hint: "Password",
                      obsecureText: true,
                      onChanged: (value) {
                        ref
                            .read(signinRequestModelProvider.notifier)
                            .update((state) => state.copyWith(password: value));
                      },
                      validator: (value) {
                        if (isNull(value)) {
                          return 'This field can not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const ProGap(y: 16),
                    ProButtonBasic(
                      text: "Sign in",
                      fontSize: 16,
                      height: 45,
                      width: double.infinity,
                      backgroundColor: ProjectColors.primary,
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          loader(screen: const SigninLoader());
                        }
                      },
                    ),
                    const ProGap(y: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ProText(
                          text: "Do not have account?",
                          fontSize: 14,
                        ),
                        ProButtonText(
                          text: "Sign up",
                          fontColor: Colors.red,
                          function: () {
                            pushReplaced(screen: const SignupScreen());
                          },
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
