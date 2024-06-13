class CreateTutionResponseModel {
  bool? success;
  String? error;

  CreateTutionResponseModel({this.success, this.error});

  CreateTutionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }
}
