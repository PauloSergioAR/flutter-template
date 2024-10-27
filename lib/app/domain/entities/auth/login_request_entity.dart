class LoginRequestEntity {
  String hash;
  LoginRequestEntity({
    required this.hash,
  });

  Map<String, dynamic> toJson() => {
        'hash_code': hash,
      };
}
