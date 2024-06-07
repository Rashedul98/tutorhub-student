class TeacherListResponseModel {
  List<Teachers>? teachers;
  String? error;

  TeacherListResponseModel({this.teachers, this.error});

  TeacherListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(Teachers.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teachers != null) {
      data['teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class Teachers {
  Location? location;
  String? sId;
  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? educationalQualification;
  List<Expertise>? expertise;
  String? email;
  String? password;
  bool? availability;
  String? date;
  int? iV;

  Teachers(
      {this.location,
      this.sId,
      this.firstName,
      this.lastName,
      this.gender,
      this.phone,
      this.educationalQualification,
      this.expertise,
      this.email,
      this.password,
      this.availability,
      this.date,
      this.iV});

  Teachers.fromJson(Map<String, dynamic> json) {
    location =
        json['Location'] != null ? Location.fromJson(json['Location']) : null;
    sId = json['_id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    gender = json['Gender'];
    phone = json['Phone'];
    educationalQualification = json['educational_qualification'];
    if (json['Expertise'] != null) {
      expertise = <Expertise>[];
      json['Expertise'].forEach((v) {
        expertise!.add(Expertise.fromJson(v));
      });
    }
    email = json['email'];
    password = json['password'];
    availability = json['Availability'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Gender'] = gender;
    data['Phone'] = phone;
    data['educational_qualification'] = educationalQualification;
    if (expertise != null) {
      data['Expertise'] = expertise!.map((v) => v.toJson()).toList();
    }
    data['email'] = email;
    data['password'] = password;
    data['Availability'] = availability;
    data['date'] = date;
    data['__v'] = iV;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Expertise {
  String? subject;
  String? scope;
  String? sId;

  Expertise({this.subject, this.scope, this.sId});

  Expertise.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    scope = json['scope'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['scope'] = scope;
    data['_id'] = sId;
    return data;
  }
}
