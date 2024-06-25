class SignupRequestModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? contactInfo;
  Institutation? institutation;
  String? address;
  String? email;
  String? password;
  String? school;
  String? college;

  SignupRequestModel(
      {this.firstName,
      this.lastName,
      this.gender,
      this.contactInfo,
      this.institutation,
      this.address,
      this.email,
      this.password,
      this.college,
      this.school});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Gender'] = gender;
    data['ContactInfo'] = contactInfo;

    if (institutation != null) {
      data['Institutation'] = institutation!.toJson();
    }
    data['Address'] = address;
    data['email'] = email;
    data['password'] = password;
    data["school"] = school;
    data["college"] = college;
    return data;
  }

  SignupRequestModel copyWith(
      {String? firstName,
      String? lastName,
      String? gender,
      String? contactInfo,
      Institutation? institutation,
      String? address,
      String? email,
      String? password,
      String? school,
      String? college}) {
    return SignupRequestModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        contactInfo: contactInfo ?? this.contactInfo,
        institutation: institutation ?? this.institutation,
        address: address ?? this.address,
        email: email ?? this.email,
        password: password ?? this.password,
        school: school ?? this.school,
        college: college ?? this.college);
  }
}

class Institutation {
  String? school;
  String? college;

  Institutation({this.school, this.college});

  Institutation.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    college = json['college'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['school'] = school;
    data['college'] = college;
    return data;
  }

  Institutation copyWith({
    String? school,
    String? college,
  }) {
    return Institutation(
      school: school ?? this.school,
      college: college ?? this.college,
    );
  }
}
