import 'package:tutorhub/models/teachers/response.dart';
import 'package:tutorhub/utilities/enums.dart';

class TeacherListState {
  final DataState dataState;
  final TeacherListResponseModel? data;
  final String? message;

  TeacherListState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  TeacherListState copyWith({
    final DataState? dataState,
    final TeacherListResponseModel? data,
    final String? message,
  }) {
    return TeacherListState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
