import 'package:dio/dio.dart';

extension AuthRequestOptionsX on RequestOptions {
  void setAuthenticationHeader(String token) =>
      headers['Authorization'] = token;
  void setAuthenticationHeaderCreateAccount(String token) =>
      headers['Authorization'] = token;
}
