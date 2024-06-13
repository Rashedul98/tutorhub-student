class SigninResponseModel {
  bool? success;
  String? token;
  String? firstName;
  String? lastName;
  String? contactInfo;
  String? email;
  String? school;
  String? college;
  String? address;
  String? error;

  SigninResponseModel(
      {this.success,
      this.token,
      this.firstName,
      this.lastName,
      this.contactInfo,
      this.email,
      this.school,
      this.college,
      this.address,
      this.error});

  SigninResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    contactInfo = json['contact_info'];
    email = json['email'];
    school = json['school'];
    college = json['college'];
    address = json['address'];
    error = json['error'];
  }
}
