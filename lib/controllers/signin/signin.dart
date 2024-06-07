import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/models/signin/response.dart';
import 'package:tutorhub/views/signin/providers.dart';

import '../../utilities/enums.dart';
import '../../utilities/functions/http_request.dart';
import '../../utilities/shared_preference.dart';
import '../../utilities/singleton.dart';
import 'signin_state.dart';

class SigninController extends StateNotifier<SigninState> {
  final Ref ref;
  SigninController({required this.ref}) : super(SigninState());

  signIn() async {
    try {
      final Response? response = await httpRequest(
        httpRequestType: HttpRequestType.post,
        path: "/student-login",
        payload: ref.read(signinRequestModelProvider).toJson(),
      );

      SigninResponseModel? data = SigninResponseModel.fromJson(response?.data);

      if (data.success == true) {
        locator<SharedPreferenceService>()
            .setBool(key: "loggedIn", value: true);

        state = state.copyWith(
          data: data,
          dataState: DataState.loaded,
        );
      } else {
        state = state.copyWith(
          message: data.error ?? "Something went wrong.",
          dataState: DataState.error,
        );
      }
    } catch (_) {
      state = state.copyWith(
        message: "Something went wrong. Please try again!",
        dataState: DataState.error,
      );
    }
  }

  reset() {
    state = SigninState();
  }
}

final signinProvider =
    StateNotifierProvider.autoDispose<SigninController, SigninState>(
  (ref) => SigninController(ref: ref),
);
