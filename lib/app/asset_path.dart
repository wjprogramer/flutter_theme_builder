class AssetPaths {
  AssetPaths._();

  static bool isAsset(String path) {
    return path.startsWith('assets/');
  }

  static const hero = 'assets/images/hero.png';
  static const plant1 = 'assets/images/plant1.svg';
  static const plant2 = 'assets/images/plant2.svg';
  static const plant3 = 'assets/images/plant3.svg';
  static const theme1 = 'assets/images/theme1.png';
  static const theme2 = 'assets/images/theme2.png';
  static const theme3 = 'assets/images/theme3.png';
  static const theme4 = 'assets/images/theme4.png';
}