class Seller {
  late String _userId;
  late String _password;
  late String _appId;

  Seller() {}

  Seller.takeInput(
      {required String userId,
      required String password,
      required String appId}) {
    _userId = userId;
    _password = password;
    _appId = appId;
  }

  String get userId => _userId;
  String get password => _password;
  String get appId => _appId;
}
