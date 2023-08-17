import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_builder/utilities/theme_utility.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;
import 'package:material_color_utilities/hct/hct_solver.dart';

/// TODO: refactor, split to files
void main() {

  // getPrettyJSONString

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

  test('Color utils / hex and argb', () {
    final colorValue = 4294957288;

    expect(hexFromArgb(colorValue), '#ffd8e8');
    myAssertEqual(argbFromHex('#9d906d'), 4288516205);
  });

  test('CAM 16', () {
    const argb = 4284437785;
    final cam16X = Cam16_fromIntInViewingConditions(argb);

    expect(cam16X.hue, 101.17838538883424);
    expect(cam16X.chroma, 30.09871415844342);
    expect(cam16X.j, 26.796364190204315);
    expect(cam16X.q, 80.50586642729215);
    expect(cam16X.m, 0.0); // TODO: JS 版本沒有這個值
    expect(cam16X.s, 54.3289727374645);
    expect(cam16X.jstar, 38.35870274332909);
    expect(cam16X.astar, -3.6812065087014454);
    expect(cam16X.bstar, 18.62833142800411);
  });

  test('HCT', () {
    const argb = 4284437785;
    final hct = colorUtilities.Hct.fromInt(argb);

    expect(hct.chroma, 30.09871415844342);
    expect(hct.hue, 101.17838538883424);
    expect(hct.tone, 35.98445374732086);
  });

  test('HCT / HctSolver.solveToInt', () {
    expect(HctSolver.solveToInt(25, 84, 20), 4285071365);
    expect(HctSolver.solveToInt(101.17838538883424, 8, 0), 4278190080);
  });

  test('Tonal Palette', () {
    final tonalPalette = colorUtilities.TonalPalette.of(25, 84);

    final tonesGroup = tonal_group_tonesToTonalGroup(tonalPalette);

    myAssertEqual(tonesGroup[0], "#000000");
    myAssertEqual(tonesGroup[10], "#410002");
    myAssertEqual(tonesGroup[20], "#690005");
    myAssertEqual(tonesGroup[25], "#7e0007");
    myAssertEqual(tonesGroup[30], "#93000a");
    myAssertEqual(tonesGroup[35], "#a80710");
    myAssertEqual(tonesGroup[40], "#ba1a1a");
    myAssertEqual(tonesGroup[50], "#de3730");
    myAssertEqual(tonesGroup[60], "#ff5449");
    myAssertEqual(tonesGroup[70], "#ff897d");
    myAssertEqual(tonesGroup[80], "#ffb4ab");
    myAssertEqual(tonesGroup[90], "#ffdad6");
    myAssertEqual(tonesGroup[95], "#ffedea");
    myAssertEqual(tonesGroup[98], "#fff8f7");
    myAssertEqual(tonesGroup[99], "#fffbff");
    myAssertEqual(tonesGroup[100], "#ffffff");
  });

  test('Core Palette', () {
    const argb = 4284437785;

    // Core Palette
    // 前面註解為 js 版本的名稱
    final corePalette = colorUtilities.CorePalette.of(argb);
    /* a1    */ myAssertEqual(corePalette.primary.toString(),         'TonalPalette.of(101.17838538883424, 48.0)');
    /* a2    */ myAssertEqual(corePalette.secondary.toString(),       'TonalPalette.of(101.17838538883424, 16.0)');
    /* a3    */ myAssertEqual(corePalette.tertiary.toString(),        'TonalPalette.of(161.17838538883424, 24.0)');
    /* n1    */ myAssertEqual(corePalette.neutral.toString(),         'TonalPalette.of(101.17838538883424, 4.0)');
    /* n2    */ myAssertEqual(corePalette.neutralVariant.toString(),  'TonalPalette.of(101.17838538883424, 8.0)');
    /* error */ myAssertEqual(corePalette.error.toString(),           'TonalPalette.of(25.0, 84.0)');

    final corePaletteContent = colorUtilities.CorePalette.contentOf(argb);
    /* a1    */ myAssertEqual(corePaletteContent.primary.toString(),         'TonalPalette.of(101.17838538883424, 30.09871415844342)');
    /* a2    */ myAssertEqual(corePaletteContent.secondary.toString(),       'TonalPalette.of(101.17838538883424, 10.03290471948114)');
    /* a3    */ myAssertEqual(corePaletteContent.tertiary.toString(),        'TonalPalette.of(161.17838538883424, 15.04935707922171)');
    /* n1    */ myAssertEqual(corePaletteContent.neutral.toString(),         'TonalPalette.of(101.17838538883424, 2.508226179870285)');
    /* n2    */ myAssertEqual(corePaletteContent.neutralVariant.toString(),  'TonalPalette.of(101.17838538883424, 5.01645235974057)');
    /* error */ myAssertEqual(corePaletteContent.error.toString(),           'TonalPalette.of(25.0, 84.0)');

    // Scheme
    colorUtilities.Scheme.lightFromCorePalette(corePalette);
  });

  test('baselineGetPalette', () {
    final primary = ThemeUtility.baselineGetPalette('primary');

    expect(primary.get(0), 4278190080);
    expect(primary.get(10), 4280352861);
    expect(primary.get(20), 4281867890);
    expect(primary.get(30), 4283381643);
    expect(primary.get(40), 4284960932);
    expect(primary.get(50), 4286539710);
    expect(primary.get(60), 4288316123);
    expect(primary.get(70), 4290158072);
    expect(primary.get(80), 4291869951);
    expect(primary.get(90), 4293582335);
    expect(primary.get(95), 4294372863);
    expect(primary.get(99), 4294966270);
    expect(primary.get(100), 4294967295);
  });

  test('', () {});

  test('', () {});

  test('', () {});

}
