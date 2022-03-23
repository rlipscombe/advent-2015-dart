import 'dart:io';

import 'package:day03/day03.dart';

void main(List<String> arguments) {
  String input = File('input.txt').readAsStringSync();
  print(part1(input));
}
