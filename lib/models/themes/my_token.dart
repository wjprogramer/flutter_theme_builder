class MyToken {
  MyToken({
    this.name = '',
    dynamic value,
    this.id = '',
  }): value = value;

  String name;
  dynamic value;
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