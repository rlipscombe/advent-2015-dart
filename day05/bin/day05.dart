import 'dart:io';

import 'package:day05/day05.dart';

void main(List<String> arguments) {
  var lines = File('input.txt').readAsLinesSync();
  int count = lines.fold(0, (acc, s) => acc += isNiceString(s) ? 1 : 0);
  print("part 1: $count");
}
