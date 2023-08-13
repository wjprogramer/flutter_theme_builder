enum MyColorSchemeKey {
  primary('primary'),
  secondary('secondary'),
  tertiary('tertiary'),
  neutral('neutral'),
  neutralVariant('neutralVariant'),
  error('error');

  const MyColorSchemeKey(this.code);

  final String code;
}