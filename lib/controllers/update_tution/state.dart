import '../../utilities/enums.dart';

class UpdateTutionState {
  final DataState dataState;
  final String? message;

  UpdateTutionState({
    this.dataState = DataState.initial,
    this.message,
  });

  UpdateTutionState copyWith({
    final DataState? dataState,
    final bool? success,
    final String? message,
  }) {
    return UpdateTutionState(
      dataState: dataState ?? this.dataState,
      message: message ?? this.message,
    );
  }
}
