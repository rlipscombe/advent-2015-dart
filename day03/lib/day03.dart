import 'dart:collection';
import 'dart:math';

int part1(String input) {
  var pos = Point(0, 0);

  Set visited = HashSet();
  visited.add(pos);

  for (var i = 0; i < input.length; ++i) {
    switch (input[i]) {
      case '>':
        pos += Point(1, 0);
        break;
      case '<':
        pos += Point(-1, 0);
        break;
      case '^':
        pos += Point(0, -1);
        break;
      case 'v':
        pos += Point(0, 1);
        break;
    }

    visited.add(pos);
  }

  return visited.length;
}
