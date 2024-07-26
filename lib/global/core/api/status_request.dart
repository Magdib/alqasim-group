enum StatusRequest {
  //custom state that use to know the state of the api request
  none,
  loading,
  success,
  failure,
  serverFailure,
  timeOutFailure,
  serverException,
  offlineFailure,
}
