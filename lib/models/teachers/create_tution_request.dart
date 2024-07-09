class CreateTutionRequestModel {
  String? teacherEmail;
  String? studentEmail;
  List<Subjects>? subjects;
  int? fee;
  String? status;

  CreateTutionRequestModel({
    this.teacherEmail,
    this.studentEmail,
    this.subjects,
    this.fee,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['teacher_email'] = teacherEmail;
    data['student_email'] = studentEmail;
    data['subjects'] = subjects;
    data['fee'] = fee;
    data['status'] = status;
    return data;
  }

  CreateTutionRequestModel copyWith({
    String? teacherEmail,
    String? studentEmail,
    List<Subjects>? subjects,
    int? fee,
    String? status,
  }) {
    return CreateTutionRequestModel(
      teacherEmail: teacherEmail ?? this.teacherEmail,
      studentEmail: studentEmail ?? studentEmail,
      subjects: subjects ?? this.subjects,
      fee: fee ?? this.fee,
      status: status ?? this.status,
    );
  }
}

class Subjects {
  String? subject;
  String? scope;

  Subjects({this.subject, this.scope});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['scope'] = scope;
    return data;
  }

  Subjects copyWith({
    String? subject,
    String? scope,
  }) {
    return Subjects(
        subject: subject ?? this.subject, scope: scope ?? this.scope);
  }
}
