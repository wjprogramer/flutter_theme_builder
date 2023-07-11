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
}