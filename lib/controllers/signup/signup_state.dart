import 'package:tutorhub/models/signup/response.dart';
import 'package:tutorhub/utilities/enums.dart';

class SignupState {
  final DataState dataState;
  final SignupResponseModel? data;
  final String? message;

  SignupState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  SignupState copyWith({
    final DataState? dataState,
    final SignupResponseModel? data,
    final String? message,
  }) {
    return SignupState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
