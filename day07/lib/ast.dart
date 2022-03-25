import 'dart:collection';

abstract class Instr {
  String target;

  Instr(this.target);

  int evaluate(HashMap<String, Instr> instructions);
}

class OrInstr extends Instr {
  String lhs;
  String rhs;

  OrInstr(this.lhs, this.rhs, String target) : super(target);

  @override
  bool operator ==(Object other) {
    return other is OrInstr &&
        lhs == other.lhs &&
        rhs == other.rhs &&
        target == other.target;
  }

  @override
  String toString() {
    return '$target := Or($lhs, $rhs)';
  }

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    var lhs_ = instructions[lhs]!.evaluate(instructions);
    var rhs_ = instructions[rhs]!.evaluate(instructions);

    var value = lhs_ | rhs_;
    // Replace ourselves with the value.
    instructions[target] = LiteralInstr(value, target);
    return value;
  }
}

class LiteralInstr extends Instr {
  int value;

  LiteralInstr(this.value, String target) : super(target);

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    return value;
  }

  @override
  bool operator ==(Object other) {
    return other is LiteralInstr &&
        value == other.value &&
        target == other.target;
  }

  @override
  String toString() {
    return '$target := $value';
  }
}

class AndInstr extends Instr {
  String lhs;
  String rhs;

  AndInstr(this.lhs, this.rhs, String target) : super(target);

  @override
  bool operator ==(Object other) {
    return other is AndInstr &&
        lhs == other.lhs &&
        rhs == other.rhs &&
        target == other.target;
  }

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    var lhs_ = instructions[lhs]!.evaluate(instructions);
    var rhs_ = instructions[rhs]!.evaluate(instructions);

    var value = lhs_ & rhs_;
    // Replace ourselves with the value.
    instructions[target] = LiteralInstr(value, target);
    return value;
  }

  @override
  String toString() {
    return '$target := And($lhs, $rhs)';
  }
}

class LShiftInstr extends Instr {
  String lhs;
  int rhs;

  LShiftInstr(this.lhs, this.rhs, String target) : super(target);

  @override
  bool operator ==(Object other) {
    return other is LShiftInstr &&
        lhs == other.lhs &&
        rhs == other.rhs &&
        target == other.target;
  }

  @override
  String toString() {
    return '$target := LShift($lhs, $rhs)';
  }

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    var lhs_ = instructions[lhs]!.evaluate(instructions);

    var value = lhs_ << rhs;
    // Replace ourselves with the value.
    instructions[target] = LiteralInstr(value, target);
    return value;
  }
}

class RShiftInstr extends Instr {
  String lhs;
  int rhs;

  RShiftInstr(this.lhs, this.rhs, String target) : super(target);

  @override
  bool operator ==(Object other) {
    return other is RShiftInstr &&
        lhs == other.lhs &&
        rhs == other.rhs &&
        target == other.target;
  }

  @override
  String toString() {
    return '$target := Or($lhs, $rhs)';
  }

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    var lhs_ = instructions[lhs]!.evaluate(instructions);

    var value = lhs_ >> rhs;
    // Replace ourselves with the value.
    instructions[target] = LiteralInstr(value, target);
    return value;
  }
}

class NotInstr extends Instr {
  String source;

  NotInstr(this.source, String target) : super(target);

  @override
  bool operator ==(Object other) {
    return other is NotInstr &&
        source == other.source &&
        target == other.target;
  }

  @override
  String toString() {
    return '$target := Not($source)';
  }

  @override
  int evaluate(HashMap<String, Instr> instructions) {
    var source_ = instructions[source]!.evaluate(instructions);

    // Bitwise complement in 16 bits:
    var value = 65535 - source_;

    // Replace ourselves with the value.
    instructions[target] = LiteralInstr(value, target);
    return value;
  }
}
