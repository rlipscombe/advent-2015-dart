import 'dart:io';

import 'package:day07/ast.dart';
import 'package:day07/parser.dart';

void main(List<String> arguments) {
  var lines = File('input.txt').readAsLinesSync();

  var definition = LogicDefinition();
  var parser = definition.build();

  var instructions = lines.map<Instr>((String line) {
    print(line);
    return parser.parse(line).value;
  });

  var context = Context(instructions);

  print('part 1: ${context.evaluate('a')}');
}
