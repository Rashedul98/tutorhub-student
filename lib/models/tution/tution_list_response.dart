class TutionListResponseModel {
  List<TutionList>? results;
  String? error;

  TutionListResponseModel({this.results, this.error});

  TutionListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <TutionList>[];
      json['results'].forEach((v) {
        results!.add(TutionList.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class TutionList {
  String? id;
  String? teacherName;
  String? teacherEmail;
  String? studentName;
  String? studentEmail;
  List<String>? subjects;
  int? fee;
  String? status;
  int? iV;

  TutionList(
      {this.id,
      this.teacherName,
      this.teacherEmail,
      this.studentName,
      this.studentEmail,
      this.subjects,
      this.fee,
      this.status,
      this.iV});

  TutionList.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    teacherName = json['teacher_name'];
    teacherEmail = json['teacher_email'];
    studentName = json['student_name'];
    studentEmail = json['student_email'];
    subjects = json['subjects'].cast<String>();
    fee = json['fee'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['teacher_name'] = teacherName;
    data['teacher_email'] = teacherEmail;
    data['student_name'] = studentName;
    data['student_email'] = studentEmail;
    data['subjects'] = subjects;
    data['fee'] = fee;
    data['status'] = status;
    data['__v'] = iV;
    return data;
  }
}
