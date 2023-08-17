class MyToken<T> {
  MyToken({
    required T value,
    this.id = '',
  }): value = value;

  T value;
  String id;

  Map<String, dynamic> toJson() {
    return {
      'value': value.toString(),
      'id': id,
    };
  }

  factory MyToken.fromJson(Map data) {
    return MyToken(
      value: data['value'],
      id: data['id'],
    );
  }
}