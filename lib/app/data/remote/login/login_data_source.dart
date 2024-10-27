import '../../../domain/domain_layer.dart';
import '../../../infra/infra.dart';

class LoginDataSource {
  final HttpImp _http;

  LoginDataSource({
    required HttpImp http,
  }) : _http = http;

  Future<Result<LoginResponseEntity>> auth({
    required LoginRequestEntity entity,
  }) async {
    return _http.dio.post(Endpoints.login, data: entity.toJson()).result(
          (json) => LoginResponseEntity.fromJson(json),
        );
  }
}
