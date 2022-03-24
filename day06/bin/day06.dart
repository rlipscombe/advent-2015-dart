import 'dart:io';

import 'package:day06/day06.dart';

void main(List<String> arguments) {
  var lines = File("input.txt").readAsLinesSync();

  var grid = Grid(1000, 1000);
  var actions = lines.map(parseAction);
  for (var action in actions) {
    action(grid);
  }

  print("part 1: ${grid.count()}");
}

var _re =
    RegExp(r'^(turn off|turn on|toggle) (\d+),(\d+) through (\d+),(\d+)$');

void Function(Grid) parseAction(String line) {
  var match = _re.firstMatch(line);
  var action = match!.group(1);
  var x0 = int.parse(match.group(2)!);
  var y0 = int.parse(match.group(3)!);
  var x1 = int.parse(match.group(4)!);
  var y1 = int.parse(match.group(5)!);

  switch (action) {
    case 'turn off':
      return (g) => g.turnOff(x0, y0, x1, y1);

    case 'turn on':
      return (g) => g.turnOn(x0, y0, x1, y1);

    case 'toggle':
      return (g) => g.toggle(x0, y0, x1, y1);
  }

  throw 'arse';
}
