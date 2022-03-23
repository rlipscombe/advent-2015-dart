import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

int mine(String key, int zeroes) {
  for (var i = 0; /* no condition */; ++i) {
    String value = key + i.toString();
    var digest = md5.convert(ascii.encode(value));
    String result = digest.toString();
    if (result.startsWith('0'.padLeft(zeroes, '0'))) {
      return i;
    }
  }
}
