import 'dart:io';

import 'package:day07/ast.dart';
import 'package:day07/parser.dart';

void main(List<String> arguments) {
  var lines = File('input.txt').readAsLinesSync();

  var definition = LogicDefinition();
  var parser = definition.build();

  var instructions = lines.map<Instr>((String line) {
    return parser.parse(line).value;
  });

  var context = Context(instructions);

  var part1 = context.evaluate('a');
  print('part 1: $part1');

  var context2 = Context(instructions);
  context2.replace('b', part1);

  var part2 = context2.evaluate('a');
  print('part 2: $part2');
}
