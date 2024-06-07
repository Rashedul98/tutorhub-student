bool isNull(dynamic value) {
  if ([null, '', "", 'null', {}, [], "Null"].contains(value)) {
    return true;
  } else {
    return false;
  }
}
