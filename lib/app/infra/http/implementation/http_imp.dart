import 'package:dio/dio.dart';

import '../../../domain/domain_layer.dart';
import '../../infra.dart';

class HttpImp extends BaseHttp {
  final GetAuthUseCase _getLoginUseCase;
  HttpImp(this._getLoginUseCase)
      : super(
          baseUrl: 'https://localhost:3000',
        );

  Future<String> getAccessToken() async {
    return await _getLoginUseCase().then(
      (data) {
        return data?.token ?? '';
      },
    );
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var token = await getAccessToken();
    options.setAuthenticationHeader(token);
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(error);
  }
}
