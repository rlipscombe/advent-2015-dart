import 'dart:collection';
import 'dart:math';

Set followInstructions(String input) {
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

  return visited;
}

int part1(String input) {
  return followInstructions(input).length;
}

int part2(String input) {
  String odds = '';
  String evens = '';

  for (var i = 0; i < input.length; ++i) {
    if (i % 2 == 0) {
      evens += input[i];
    } else {
      odds += input[i];
    }
  }

  var visited = followInstructions(odds).union(followInstructions(evens));
  return visited.length;
}
