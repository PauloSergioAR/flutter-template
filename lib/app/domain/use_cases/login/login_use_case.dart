import 'package:flutter_template/app/data/remote/login/login_data_source.dart';

import '../../../data/data_layer.dart';
import '../../domain_layer.dart';

class LoginUseCase {
  final SharedHelper _shared;
  final LoginDataSource _loginDataSource;

  LoginUseCase({
    required SharedHelper shared,
    required LoginDataSource loginDataSource,
  })  : _shared = shared,
        _loginDataSource = loginDataSource;

  Future<dynamic> call(LoginRequestEntity entity) async {
    var response = await _loginDataSource.auth(entity: entity);
    await _shared.setStorageData(SharedKeys.auth, response.data.toJson());
  }
}
