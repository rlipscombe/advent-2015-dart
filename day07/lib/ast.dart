import 'dart:collection';

class Context {
  final HashMap<String, Expr> _instructions;

  Context(Iterable<Instr> instructions)
      : _instructions = HashMap.fromEntries(
            instructions.map((instr) => MapEntry(instr.target, instr.expr)));

  int evaluate(String target) {
    Expr expr = _instructions[target]!;
    var value = expr.evaluate(this);
    _instructions[target] = LiteralExpr(value);
    return value;
  }

  Expr lookup(String key) {
    return _instructions[key]!;
  }

  void replace(String key, int value) {
    _instructions[key] = LiteralExpr(value);
  }
}

abstract class Expr {
  int evaluate(Context context);
}

class Instr {
  Expr expr;
  String target;

  Instr(this.expr, this.target);

  @override
  bool operator ==(Object other) {
    return other is Instr && expr == other.expr && target == other.target;
  }

  @override
  String toString() {
    return '$target := $expr';
  }
}

class LiteralExpr extends Expr {
  int value;

  LiteralExpr(this.value);

  @override
  int evaluate(Context context) {
    return value;
  }

  @override
  bool operator ==(Object other) {
    return other is LiteralExpr && value == other.value;
  }

  @override
  String toString() {
    return '$value';
  }
}

class LookupExpr extends Expr {
  String key;

  LookupExpr(this.key);

  @override
  int evaluate(Context context) {
    Expr expr = context.lookup(key);
    var value = expr.evaluate(context);
    context.replace(key, value);
    return value;
  }

  @override
  bool operator ==(Object other) {
    return other is LookupExpr && key == other.key;
  }

  @override
  String toString() {
    return key;
  }
}

abstract class BinaryExpr extends Expr {
  Expr lhs;
  Expr rhs;

  BinaryExpr(this.lhs, this.rhs);

  @override
  int evaluate(Context context) {
    var lhs_ = lhs.evaluate(context);
    var rhs_ = rhs.evaluate(context);
    var value = operator(lhs_, rhs_);
    return value;
  }

  int operator(int lhs_, int rhs_);

  @override
  bool operator ==(Object other) {
    return other is BinaryExpr && lhs == other.lhs && rhs == other.rhs;
  }
}

class AndExpr extends BinaryExpr {
  AndExpr(Expr lhs, Expr rhs) : super(lhs, rhs);

  @override
  int operator(int lhs_, int rhs_) {
    return lhs_ & rhs_;
  }

  @override
  bool operator ==(Object other) {
    return other is AndExpr && super == other;
  }

  @override
  String toString() {
    return 'And($lhs, $rhs)';
  }
}

class OrExpr extends BinaryExpr {
  OrExpr(Expr lhs, Expr rhs) : super(lhs, rhs);

  @override
  int operator(int lhs_, int rhs_) {
    return lhs_ | rhs_;
  }

  @override
  bool operator ==(Object other) {
    return other is OrExpr && super == other;
  }

  @override
  String toString() {
    return 'Or($lhs, $rhs)';
  }
}

class LShiftExpr extends BinaryExpr {
  LShiftExpr(Expr lhs, Expr rhs) : super(lhs, rhs);

  @override
  int operator(int lhs_, int rhs_) {
    return lhs_ << rhs_;
  }

  @override
  bool operator ==(Object other) {
    return other is LShiftExpr && super == other;
  }

  @override
  String toString() {
    return 'LShift($lhs, $rhs)';
  }
}

class RShiftExpr extends BinaryExpr {
  RShiftExpr(Expr lhs, Expr rhs) : super(lhs, rhs);

  @override
  int operator(int lhs_, int rhs_) {
    return lhs_ >> rhs_;
  }

  @override
  bool operator ==(Object other) {
    return other is RShiftExpr && super == other;
  }

  @override
  String toString() {
    return 'RShift($lhs, $rhs)';
  }
}

abstract class UnaryExpr extends Expr {
  Expr expr;

  UnaryExpr(this.expr);

  @override
  int evaluate(Context context) {
    var value = expr.evaluate(context);
    return operator(value);
  }

  int operator(int value);

  @override
  bool operator ==(Object other) {
    return other is UnaryExpr && expr == other.expr;
  }
}

class NotExpr extends UnaryExpr {
  NotExpr(Expr expr) : super(expr);

  @override
  int operator(int value) {
    // bitwise complement, 16-bit.
    return 65535 - value;
  }

  @override
  bool operator ==(Object other) {
    return other is NotExpr && super == other;
  }

  @override
  String toString() {
    return 'Not($expr)';
  }
}
