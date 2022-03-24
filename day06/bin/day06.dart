import 'dart:io';

import 'package:day06/day06.dart';

void main(List<String> arguments) {
  var lines = File("input.txt").readAsLinesSync();

  var grid = Grid(1000, 1000, false);
  var actions = lines.map(parseAction);
  for (var action in actions) {
    action(grid);
  }

  print('part 1: ${grid.count()}');

  var grid2 = Grid(1000, 1000, 0);
  var actions2 = lines.map(parseAction2);
  for (var action in actions2) {
    action(grid2);
  }
  print('part 2: ${grid2.sum()}');
}

var _re =
    RegExp(r'^(turn off|turn on|toggle) (\d+),(\d+) through (\d+),(\d+)$');

void Function(Grid<bool>) parseAction(String line) {
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

    default:
      throw 'unrecognized action';
  }
}

void Function(Grid<int>) parseAction2(String line) {
  var match = _re.firstMatch(line);
  var action = match!.group(1);
  var x0 = int.parse(match.group(2)!);
  var y0 = int.parse(match.group(3)!);
  var x1 = int.parse(match.group(4)!);
  var y1 = int.parse(match.group(5)!);

  switch (action) {
    case 'turn off':
      return (g) => g.apply(x0, y0, x1, y1, (b) => (b > 1 ? b - 1 : 0));

    case 'turn on':
      return (g) => g.apply(x0, y0, x1, y1, (b) => b + 1);

    case 'toggle':
      return (g) => g.apply(x0, y0, x1, y1, (b) => b + 2);

    default:
      throw 'unrecognized action';
  }
}
