import 'dart:convert';

void myAssertEqual(a, b) {
  try {
    if (a is List && b is List) {
      if (a.length != b.length) {
        throw Exception();
      }
      for (var i = 0; i < a.length; i++) {
        if (a[i] != b[i]) {
          throw Exception();
        }
      }
    } else if (a != b) {
      throw Exception();
    }
  } catch (e) {
    throw Exception('Failed assertion: \'$a == $b\': is not true.');
  }
}

// TODO: 需要 deepClone
Map<dynamic, dynamic> myJsonConverter(Map data, {
  required dynamic Function(dynamic key, dynamic value) toEncodable,
}) {
  final newData = <dynamic, dynamic>{};
  newData.addAll(data);

  tourMap(Map<dynamic, dynamic> d) {
    for (final entry in d.entries) {
      var newValue = toEncodable(entry.key, entry.value);
      newValue = newValue is Map ? convertToDynamicMap(newValue) : newValue;
      d[entry.key] = newValue;

      if (newValue is Map) {
        tourMap(newValue);
      }
    }
  }

  tourMap(newData);
  return newData;
}

Map<dynamic, dynamic> convertToDynamicMap(Map v) {
  final newMap = <dynamic, dynamic>{};
  for (final entry in v.entries) {
    newMap[entry.key] = entry.value;
  }
  return newMap;
}

String getPrettyJSONString(jsonObject){
  var encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}
