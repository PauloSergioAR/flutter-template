// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';

import '../../http.dart';

extension FutureExtension on Future<Response> {
  Future<Result<R>> result<R>(
    R Function(Map<String, dynamic> json) onValue,
  ) async {
    try {
      var response = await this;
      Map<String, dynamic> encodedData;

      encodedData = response.data;

      var res = ApiResponse.fromJson(encodedData);

      if (res.error == null) {
        return Result.success(onValue(res.data ?? {}));
      }

      logger.e(
        '[ERROR] ${res.error!.message}'
        '|| [ERROR TYPE] : Failure.dioFailure'
        '|| [FUTURE METHOD] : Future<Result<R>> result<R>'
        '|| [WHERE] : ${response.requestOptions.uri.toString()}'
        '|| [METHOD] : ${response.requestOptions.method}'
        '|| [QUERY PARAMETRS] : ${response.requestOptions.queryParameters}'
        '|| [DATA] : ${response.requestOptions.data}',
      );

      return Result.error(Failure.dataFailure(res.error!));
    } on DioException catch (e) {
      logger.e(
        '[ERROR] ${e.message}'
        '|| [ERROR TYPE] : Failure.dioFailure'
        '|| [FUTURE METHOD] : Future<Result<R>> result<R>'
        '|| [WHERE] : ${e.requestOptions.uri.toString()}'
        '|| [METHOD] : ${e.requestOptions.method}'
        '|| [QUERY PARAMETRS] : ${e.requestOptions.queryParameters}'
        '|| [DATA] : ${e.requestOptions.data}',
      );

      return Result.error(Failure.dioFailure(e));
    } on TypeError catch (e) {
      logger.e(
        '[ERROR] ${e.toString()}'
        '|| [ERROR TYPE] : Failure.unknownFailure'
        '|| [WHERE] : ${e.stackTrace}',
      );

      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<R>> resultString<R>(
    R Function(String json) onValue,
  ) async {
    try {
      var response = await this;

      var res = ApiResponse.fromJson(response.data);
      if ((response.statusCode ?? 0) < 299) {
        return Result.success(onValue(response.data));
      }

      logger.e(
        '[ERROR] ${res.error}'
        '|| [ERROR TYPE] : Failure.dioFailure'
        '|| [FUTURE METHOD] : Future<Result<R>> result<R>'
        '|| [WHERE] : ${response.requestOptions.uri.toString()}'
        '|| [METHOD] : ${response.requestOptions.method}'
        '|| [QUERY PARAMETRS] : ${response.requestOptions.queryParameters}'
        '|| [DATA] : ${response.requestOptions.data}',
      );

      return Result.error(Failure.dataFailure(res.error!));
    } on DioException catch (e) {
      logger.e(
        '[ERROR] ${e.message}'
        '|| [ERROR TYPE] : Failure.dioFailure'
        '|| [FUTURE METHOD] : Future<Result<R>> result<R>'
        '|| [WHERE] : ${e.requestOptions.uri.toString()}'
        '|| [METHOD] : ${e.requestOptions.method}'
        '|| [QUERY PARAMETRS] : ${e.requestOptions.queryParameters}'
        '|| [DATA] : ${e.requestOptions.data}',
      );

      return Result.error(Failure.dioFailure(e));
    } on TypeError catch (e) {
      logger.e(
        '[ERROR] ${e.toString()}'
        '|| [ERROR TYPE] : Failure.unknownFailure'
        '|| [WHERE] : ${e.stackTrace}',
      );
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
