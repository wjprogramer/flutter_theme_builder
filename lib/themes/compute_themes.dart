import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utils/core/image.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

Future<MyDemoThemeData> computeBuildThemeFromImage(String assetPath) async {
  final imageData = (await assetImageToByte(assetPath)).buffer.asInt8List();

  final x = await compute(
    _compute,
    jsonEncode({
      'assetPath': assetPath,
      'imageData': imageData,
    })
  );

  return MyDemoThemeData.fromJson(jsonDecode(x));
}

_compute(String rawMap) async {
  final map = jsonDecode(rawMap);

  final assetPath = map['assetPath'] as String;
  final imageData = map['imageData'] as List;
  final a = await buildThemeFromImage(
      assetPath,
      imageData: Int8List.fromList(
          imageData
              .whereType<num>()
              .map((e) => e.toInt()).toList()
      )
  );

  return jsonEncode(a.toJson());
}