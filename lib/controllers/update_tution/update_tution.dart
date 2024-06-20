import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/enums.dart';
import '../../utilities/functions/http_request.dart';
import '../../views/home/providers.dart';
import 'state.dart';

class UpdateTutionController extends StateNotifier<UpdateTutionState> {
  final Ref ref;
  UpdateTutionController({required this.ref}) : super(UpdateTutionState());

  update() async {
    try {
      final Response? response = await httpRequest(
        httpRequestType: HttpRequestType.post,
        path: "/updatetutionstudent",
        payload: ref.read(updateTutionModelProvider).toJson(),
      );

      if (response?.data != null) {
        if (response?.data['error'] == null) {
          if (response?.data['success'] == true) {
            state = state.copyWith(
              dataState: DataState.loaded,
            );
          } else {
            state = state.copyWith(
              dataState: DataState.error,
              message: "Something went wrong. Please try again!",
            );
          }
        } else {
          state = state.copyWith(
            dataState: DataState.error,
            message: "Something went wrong. Please try again!",
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
    state = UpdateTutionState();
  }
}

final updateTutionProvider = StateNotifierProvider.autoDispose<
    UpdateTutionController, UpdateTutionState>(
  (ref) => UpdateTutionController(ref: ref),
);
