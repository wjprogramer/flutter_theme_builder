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