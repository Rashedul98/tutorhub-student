class SigninRequestModel {
  String? email;
  String? password;

  SigninRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  SigninRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return SigninRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
