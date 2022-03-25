import 'dart:collection';

import 'ast.dart';

class Wires {
  HashMap<String, Instr> _instructions;

  Wires(Iterable<Instr> instructions)
      : _instructions = HashMap.fromEntries(
            instructions.map((instr) => MapEntry(instr.target, instr)));

  int evaluate(String target) {
    Instr instr = _instructions[target]!;
    return instr.evaluate(_instructions);
  }
}
