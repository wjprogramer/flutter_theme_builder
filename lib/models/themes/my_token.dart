class MyToken<T> {
  MyToken({
    this.name = '',
    required T value,
    this.id = '',
  }): value = value;

  String name;
  T value;
  String id;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value.toString(),
      'id': id,
    };
  }

  factory MyToken.fromJson(Map data) {
    return MyToken(
      name: data['name'],
      value: data['value'],
      id: data['id'],
    );
  }
}