class MyCustomColor {
  MyCustomColor({
    required this.name,
    required this.harmonized,
    required this.color,
  });

  String name;
  bool harmonized;
  String color;

  Map toJson() => {
    'name': name,
    'harmonized': harmonized,
    'color': color,
  };

  factory MyCustomColor.fromJson(Map data) {
    return MyCustomColor(
      name: data['name'],
      harmonized: data['harmonized'],
      color: data['color'],
    );
  }
}