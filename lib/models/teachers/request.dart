class TeacherListRequestModel {
  List<String>? subject;
  String? scope;
  double? latitude;
  double? longitude;

  TeacherListRequestModel(
      {this.subject, this.scope, this.latitude, this.longitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['scope'] = scope;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  TeacherListRequestModel copyWith({
    List<String>? subject,
    String? scope,
    double? latitude,
    double? longitude,
  }) {
    return TeacherListRequestModel(
      subject: subject ?? this.subject,
      scope: scope ?? this.scope,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
