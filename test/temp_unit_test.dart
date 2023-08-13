import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

/// TODO: refactor, split to files
void main() {

  test('JSON converter / Transform values', () {
    final jsonObj = {
      'name': 'hello',
      'value': '123',
      'private_info': 'my_password',
      'relation': {
        'value': '456',
      },
    };

    final res = myJsonConverter(jsonObj, toEncodable: (key, value) {
      if (value is Map) {
        return {...value};
      }
      if (key == 'private_info') {
        return null;
      }
      return int.tryParse(value) ?? value;
    });

    expect(res['value'], 123);
    expect(res['private_info'], null);
    expect(res['relation']['value'], 456);
  });

  test('Color utils / hex from argb', () {
    final colorValue = 4294957288;

    expect(hexFromArgb(colorValue), '#ffd8e8');
  });

}
