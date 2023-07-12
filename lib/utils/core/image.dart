import 'package:flutter/services.dart' show ByteData, rootBundle;

Future<ByteData> assetImageToByte(String assetPath) async {
  ByteData bytes = await rootBundle.load(assetPath);
  return bytes;
}

