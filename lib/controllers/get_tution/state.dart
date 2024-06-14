import 'package:tutorhub/models/tution/tution_list_response.dart';
import 'package:tutorhub/utilities/enums.dart';

class GetTutionState {
  final DataState dataState;
  final TutionListResponseModel? data;
  final String? message;

  GetTutionState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  GetTutionState copyWith({
    final DataState? dataState,
    final TutionListResponseModel? data,
    final String? message,
  }) {
    return GetTutionState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
