export 'material/colors.dart';
export 'material/material.dart';

extension StringX on String {
  String repeat(int count) {
    var r = '';
    for (var i = 0; i < count; i++) {
      r += this;
    }
    return r;
  }
}