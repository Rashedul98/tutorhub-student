class UpdateTutionModelReq {
  String? id;
  String? status;

  UpdateTutionModelReq({this.id, this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;

    return data;
  }

  UpdateTutionModelReq copyWith({
    String? id,
    String? status,
  }) {
    return UpdateTutionModelReq(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }
}
