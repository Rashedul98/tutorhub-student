import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorhub/models/teachers/create_tution_request.dart';
import 'package:tutorhub/models/teachers/request.dart';

final teacherListRequestModelProvider =
    StateProvider((ref) => TeacherListRequestModel());

final createTutionRequestModelProvider =
    StateProvider((ref) => CreateTutionRequestModel());
