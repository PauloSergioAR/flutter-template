class ExampleEntity {
  bool? example;

  ExampleEntity({
    this.example,
  });

  factory ExampleEntity.fromJson(Map<String, dynamic> json) => ExampleEntity(
        example: json["example"],
      );

  Map<String, dynamic> toJson() => {
        "example": example,
      };
}
