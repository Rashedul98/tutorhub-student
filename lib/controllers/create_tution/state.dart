import 'package:tutorhub/utilities/enums.dart';

import '../../models/teachers/create_tution_response.dart';

class CreateTutionState {
  final DataState dataState;
  final CreateTutionResponseModel? data;
  final String? message;

  CreateTutionState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  CreateTutionState copyWith({
    final DataState? dataState,
    final CreateTutionResponseModel? data,
    final String? message,
  }) {
    return CreateTutionState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
