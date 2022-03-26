import 'package:petitparser/petitparser.dart';
import 'ast.dart';

class LogicDefinition extends GrammarDefinition {
  @override
  Parser start() => ref0(instruction);

  Parser<Instr> instruction() =>
      (expression() & string('->').trim() & ref0(target))
          .map((values) => Instr(values[0], values[2]));

  Parser<Expr> expression() =>
      (and() | or() | rshift() | lshift() | not() | number()).cast<Expr>();

  Parser<NotExpr> not() => unary('NOT', (source) => NotExpr(source));

  Parser<AndExpr> and() => binary('AND', (lhs, rhs) => AndExpr(lhs, rhs));
  Parser<OrExpr> or() => binary('OR', (lhs, rhs) => OrExpr(lhs, rhs));

  Parser<LShiftExpr> lshift() =>
      binary('LSHIFT', (lhs, rhs) => LShiftExpr(lhs, rhs));
  Parser<RShiftExpr> rshift() =>
      binary('RSHIFT', (lhs, rhs) => RShiftExpr(lhs, rhs));

  Parser<R> binary<R>(String op, R Function(Expr lhs, Expr rhs) f) =>
      (ref0(either) & string(op).trim() & ref0(either))
          .map((values) => f(values[0], values[2]));

  Parser<R> unary<R>(String op, R Function(Expr source) f) =>
      (string(op).trim() & ref0(either)).map((values) => f(values[1]));

  Parser<String> target() => (letter() & letter().star()).flatten();

  Parser<Expr> either() => (ref0(id) | ref0(number)).cast<Expr>();

  Parser<LookupExpr> id() => ((letter() & letter().star()).flatten())
      .map((value) => LookupExpr(value));
  Parser<LiteralExpr> number() =>
      (digit().plus().flatten()).map((value) => LiteralExpr(int.parse(value)));
}
