import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';

import 'package:tutorhub/utilities/functions/null_checker.dart';
import 'package:tutorhub/views/signin/signin.dart';
import 'package:tutorhub/views/signup/loader.dart';
import 'package:tutorhub/views/signup/providers.dart';

import '../../models/signup/request.dart';
import '../../utilities/functions/navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const ProText(
            text: "Signup",
            fontSize: 18,
            color: ProjectColors.blue500,
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Form(
              key: _formKey,
              child: Consumer(
                builder: (context, ref, child) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "First name",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                              (state) => state.copyWith(firstName: value));
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
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "Last name",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                              (state) => state.copyWith(lastName: value));
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
                      const ProText(
                        text: 'Select gender',
                      ),
                      const ProGap(y: 8),
                      Row(
                        children: [
                          ProRadioButton(
                            title: "Male",
                            checked:
                                ref.watch(signupRequestModelProvider).gender ==
                                    "Male",
                            onTap: (_) {
                              ref
                                  .read(signupRequestModelProvider.notifier)
                                  .update((state) =>
                                      state.copyWith(gender: "Male"));
                            },
                          ),
                          const ProGap(x: 16),
                          ProRadioButton(
                            title: "Female",
                            checked:
                                ref.watch(signupRequestModelProvider).gender ==
                                    "Female",
                            onTap: (value) {
                              ref
                                  .read(signupRequestModelProvider.notifier)
                                  .update((state) =>
                                      state.copyWith(gender: "Female"));
                            },
                          ),
                        ],
                      ),
                      const ProGap(y: 16),
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "Email",
                        onChanged: (value) {
                          ref
                              .read(signupRequestModelProvider.notifier)
                              .update((state) => state.copyWith(email: value));
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
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "Contact info",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                              (state) => state.copyWith(contactInfo: value));
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
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "School name",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                                (state) => state.copyWith(
                                  institutation: Institutation(
                                    school: value,
                                    college: state.institutation?.college,
                                  ),
                                ),
                              );
                        },
                      ),
                      const ProGap(y: 16),
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "College name",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                                (state) => state.copyWith(
                                  institutation: Institutation(
                                    school: state.institutation?.school,
                                    college: value,
                                  ),
                                ),
                              );
                        },
                      ),
                      const ProGap(y: 16),
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "Address",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                              (state) => state.copyWith(address: value));
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
                      ProTextFormField(
                        borderColor: Colors.black12,
                        borderWidth: 1,
                        hint: "Password",
                        onChanged: (value) {
                          ref.read(signupRequestModelProvider.notifier).update(
                              (state) => state.copyWith(password: value));
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
                        text: "Sign up",
                        fontSize: 16,
                        height: 45,
                        width: double.infinity,
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            loader(screen: const SignupLoader());
                          }
                        },
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
                            fontColor: Colors.red,
                            function: () {
                              pushReplaced(screen: const SigninScreen());
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
      ),
    );
  }
}
