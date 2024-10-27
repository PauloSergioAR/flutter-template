// ignore_for_file: avoid_dynamic_calls

class ApiResponse {
  ApiResponse({
    this.data,
    this.error,
  });

  final Map<String, dynamic>? data;
  final ErrorResponse? error;

  factory ApiResponse.fromJsonBase(dynamic json) {
    return ApiResponse(
      data: json,
      error: json['message'] != null
          ? ErrorResponse.fromJson(json['message'])
          : null,
    );
  }

  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(data: json);
  }
}

class ErrorResponse {
  final String message;

  ErrorResponse({
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
    );
  }
}
