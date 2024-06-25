class SignupResponseModel {
  bool? success;
  Null error;

  SignupResponseModel({this.success, this.error});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    return data;
  }
}
