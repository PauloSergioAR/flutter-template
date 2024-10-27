import '../../../data/data_layer.dart';
import '../../domain_layer.dart';

class SetAuthUseCase {
  final SharedHelper _shared;

  SetAuthUseCase({
    required SharedHelper shared,
  }) : _shared = shared;

  Future<dynamic> call(LoginResponseEntity auth) async {
    await _shared.setStorageData(SharedKeys.auth, auth.toJson());
  }
}
