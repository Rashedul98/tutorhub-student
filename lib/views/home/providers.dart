import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/tution/update_tution_request.dart';

final updateTutionModelProvider =
    StateProvider((ref) => UpdateTutionModelReq());
