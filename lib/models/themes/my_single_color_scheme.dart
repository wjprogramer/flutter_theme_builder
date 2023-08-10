class MySingleColorScheme {
  MySingleColorScheme({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  int color;
  int onColor;
  int colorContainer;
  int onColorContainer;

  Map toJson() {
    return {
      'color': color,
      'onColor': onColor,
      'colorContainer': colorContainer,
      'onColorContainer': onColorContainer,
    };
  }

  factory MySingleColorScheme.fromJson(Map json) {
    return MySingleColorScheme(
      color: json['color'],
      onColor: json['onColor'],
      colorContainer: json['colorContainer'],
      onColorContainer: json['onColorContainer'],
    );
  }

}