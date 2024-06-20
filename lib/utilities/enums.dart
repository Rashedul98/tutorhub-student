enum HttpRequestType {
  get,
  post,
  put,
  delete,
}

enum DataState {
  initial,
  loading,
  loaded,
  empty,
  error,
}

enum ScopeType {
  primarySchool("primary-school", "Primary School"),
  highSchool("high-school", "High School"),
  college("college", "College"),
  oLevel("o-level", "O Level"),
  aLevel("a-level", "A Level");

  final String value;
  final String name;

  const ScopeType(this.value, this.name);
}

enum TutionStatus {
  requested("requested", "Requested"),
  pendingPayment("pending-payment", "Pending Payment"),
  enrolled("enrolled", "Enrolled"),
  rejected("rejected", "Rejected"),
  canceled("canceled", "Canceled"),
  completed("completed", "Completed");

  final String value;
  final String name;

  const TutionStatus(this.value, this.name);
}
