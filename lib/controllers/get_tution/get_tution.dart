import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/controllers/get_tution/state.dart';
import 'package:tutorhub/models/tution/tution_list_response.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';

import '../../utilities/enums.dart';
import '../../utilities/functions/http_request.dart';

class GetTutionController extends StateNotifier<GetTutionState> {
  final Ref ref;
  GetTutionController({required this.ref}) : super(GetTutionState());

  get() async {
    try {
      String? email =
          await locator<SharedPreferenceService>().getString(key: "userEmail");

      final Response? response = await httpRequest(
        httpRequestType: HttpRequestType.post,
        path: "/gettutionsstudent",
        payload: {
          "email": email,
        },
      );

      TutionListResponseModel? data =
          TutionListResponseModel.fromJson(response?.data);
      if (data.error == null) {
        if (data.results != null && data.results!.isNotEmpty) {
          state = state.copyWith(
            data: data,
            dataState: DataState.loaded,
          );
        } else {
          state = state.copyWith(
            message: "No data found",
            dataState: DataState.empty,
          );
        }
      } else {
        state = state.copyWith(
          message: "Something went wrong. Please try again!",
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
    state = GetTutionState();
  }
}

final getTutionProvider =
    StateNotifierProvider.autoDispose<GetTutionController, GetTutionState>(
  (ref) => GetTutionController(ref: ref),
);
