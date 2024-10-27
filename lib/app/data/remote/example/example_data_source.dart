import '../../../domain/domain_layer.dart';
import '../../../infra/infra.dart';

class ExampleDataSource {
  final HttpImp _http;

  ExampleDataSource({
    required HttpImp http,
  }) : _http = http;

  Future<Result<LoginResponseEntity>> auth({
    required LoginRequestEntity entity,
  }) async {
    return _http.dio.post(Endpoints.example, data: entity.toJson()).result(
          (json) => LoginResponseEntity.fromJson(json),
        );
  }
}
