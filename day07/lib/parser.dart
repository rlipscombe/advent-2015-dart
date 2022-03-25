import 'package:petitparser/petitparser.dart';
import 'ast.dart';

class LogicDefinition extends GrammarDefinition {
  @override
  Parser start() => ref0(instruction);

  Parser<Instr> instruction() =>
      (literal() | not() | and() | or() | lshift() | rshift()).cast<Instr>();

  Parser<LiteralInstr> literal() => (number() & string('->').trim() & ref0(id))
      .map((values) => LiteralInstr(values[0], values[2]));

  Parser<NotInstr> not() =>
      unary('NOT', (source, target) => NotInstr(source, target));

  Parser<AndInstr> and() =>
      binary('AND', (lhs, rhs, target) => AndInstr(lhs, rhs, target));
  Parser<OrInstr> or() =>
      binary('OR', (lhs, rhs, target) => OrInstr(lhs, rhs, target));

  Parser<LShiftInstr> lshift() =>
      shift('LSHIFT', (lhs, rhs, target) => LShiftInstr(lhs, rhs, target));
  Parser<RShiftInstr> rshift() =>
      shift('RSHIFT', (lhs, rhs, target) => RShiftInstr(lhs, rhs, target));

  Parser<R> binary<R>(
          String op, R Function(String lhs, String rhs, String target) f) =>
      (ref0(id) & string(op).trim() & ref0(id) & string('->').trim() & ref0(id))
          .map((values) => f(values[0], values[2], values[4]));

  Parser<R> shift<R>(
          String op, R Function(String lhs, int rhs, String target) f) =>
      (ref0(id) &
              string(op).trim() &
              ref0(number) &
              string('->').trim() &
              ref0(id))
          .map((values) => f(values[0], values[2], values[4]));

  Parser<R> unary<R>(String op, R Function(String source, String target) f) =>
      (string(op).trim() & ref0(id) & string('->').trim() & ref0(id))
          .map((values) => f(values[1], values[3]));

  Parser<String> id() => (letter() & letter().star()).flatten();

  Parser<int> number() => (digit().plus().flatten()).map(int.parse);
}
