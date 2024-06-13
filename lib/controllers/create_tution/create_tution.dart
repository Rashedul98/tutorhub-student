import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/controllers/create_tution/state.dart';
import 'package:tutorhub/models/teachers/create_tution_response.dart';
import 'package:tutorhub/views/signin/providers.dart';

import '../../utilities/enums.dart';
import '../../utilities/functions/http_request.dart';

class CreateTutionController extends StateNotifier<CreateTutionState> {
  final Ref ref;
  CreateTutionController({required this.ref}) : super(CreateTutionState());

  create() async {
    try {
      final Response? response = await httpRequest(
        httpRequestType: HttpRequestType.post,
        path: "/tutions",
        payload: ref.read(signinRequestModelProvider).toJson(),
      );

      CreateTutionResponseModel? data =
          CreateTutionResponseModel.fromJson(response?.data);

      if (data.success == true) {
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
    state = CreateTutionState();
  }
}

final createTutionProvider = StateNotifierProvider.autoDispose<
    CreateTutionController, CreateTutionState>(
  (ref) => CreateTutionController(ref: ref),
);
