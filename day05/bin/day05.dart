import 'dart:io';

import 'package:day05/day05.dart';

extension Functional<E> on Iterable<E> {
  int count(bool Function(E elt) predicate) {
    return fold(0, (acc, elt) => acc + (predicate(elt) ? 1 : 0));
  }
}

void main(List<String> arguments) {
  var lines = File('input.txt').readAsLinesSync();
  int part1 = lines.count(isNiceString);
  print("part 1: $part1");
  int part2 = lines.count(isNiceString2);
  print("part 2: $part2");
}
