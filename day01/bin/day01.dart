import 'dart:io';

import 'package:day01/day01.dart';

Future<void> main(List<String> arguments) async {
  var input = await File("input.txt").readAsString();
  print(day1(input));
}
