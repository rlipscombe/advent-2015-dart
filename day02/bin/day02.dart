import 'dart:io';

import 'package:day02/day02.dart';

void main(List<String> arguments) {
  // Each line is WxDxH.
  var lines = File("input.txt").readAsLinesSync();
  var presents = lines.map((line) => line.split("x").map(int.parse));
  int part1 = presents.fold(
      0, (total, dimensions) => total + paperFor(dimensions.toList()));
  print(part1);

  int part2 = presents.fold(
      0, (total, dimensions) => total + ribbonFor(dimensions.toList()));
  print(part2);
}
