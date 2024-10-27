// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginResponseEntity {
  String? message;
  String? token;

  LoginResponseEntity({
    required this.message,
    required this.token,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      LoginResponseEntity(
        message: json['message'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'token': token,
    };
  }
}
