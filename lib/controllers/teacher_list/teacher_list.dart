import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/models/teachers/response.dart';
import 'package:tutorhub/views/teachers/providers.dart';

import '../../utilities/enums.dart';
import '../../utilities/functions/http_request.dart';
import 'state.dart';

class TeacherListController extends StateNotifier<TeacherListState> {
  final Ref ref;
  TeacherListController({required this.ref}) : super(TeacherListState());

  getTeachers() async {
    try {
      final Response? response = await httpRequest(
        httpRequestType: HttpRequestType.post,
        path: "/teacher-list",
        payload: ref.read(teacherListRequestModelProvider).toJson(),
      );

      TeacherListResponseModel? data =
          TeacherListResponseModel.fromJson(response?.data);

      if (data.error == null) {
        if (data.teachers != null && data.teachers!.isNotEmpty) {
          state = state.copyWith(
            dataState: DataState.loaded,
            data: data,
          );
        } else {
          state = state.copyWith(
            message: "No data found",
            dataState: DataState.empty,
          );
        }
      } else {
        state = state.copyWith(
          message: "Something went wrong.",
          dataState: DataState.error,
        );
      }
    } catch (e) {
      state = state.copyWith(
        message: "Something went wrong. Please try again!",
        dataState: DataState.error,
      );
    }
  }

  reset() {
    state = TeacherListState();
  }
}

final teacherListProvider =
    StateNotifierProvider.autoDispose<TeacherListController, TeacherListState>(
  (ref) => TeacherListController(ref: ref),
);
