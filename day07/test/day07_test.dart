import 'package:day07/ast.dart';
import 'package:day07/parser.dart';
import 'package:test/test.dart';

void main() {
  group('parser', () {
    test('id', () {
      var definition = LogicDefinition();
      expect(definition.id().parse('lf').value, equals(LookupExpr('lf')));
    });

    test('and', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('lf AND lq -> ls').value,
          equals(Instr(AndExpr(LookupExpr('lf'), LookupExpr('lq')), 'ls')));
    });

    test('literal and', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('1 AND io -> ip').value,
          equals(Instr(AndExpr(LiteralExpr(1), LookupExpr('io')), 'ip')));
    });

    test('or', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('bo OR bu -> bv').value,
          equals(Instr(OrExpr(LookupExpr('bo'), LookupExpr('bu')), 'bv')));
    });

    test('not', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('NOT fx -> fy').value,
          equals(Instr(NotExpr(LookupExpr('fx')), 'fy')));
    });

    test('literal', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(
          parser.parse('456 -> y').value, equals(Instr(LiteralExpr(456), 'y')));
    });

    test('assign', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(
          parser.parse('lx -> a').value, equals(Instr(LookupExpr('lx'), 'a')));
    });
  });

  group('for example', () {
    var input = '''
123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
''';

    test('', () {
      var definition = LogicDefinition();
      var parser = definition.build();

      // TODO: parser taking a sequence of lines, so (a) we don't need to do the split; (b) line numbers are correct.
      var instructions = input
          .trim()
          .split('\n')
          .map<Instr>((String line) => parser.parse(line).value);

      var context = Context(instructions);

      expect(context.evaluate('d'), equals(72));
      expect(context.evaluate('e'), equals(507));
      expect(context.evaluate('f'), equals(492));
      expect(context.evaluate('g'), equals(114));
      expect(context.evaluate('h'), equals(65412));
      expect(context.evaluate('i'), equals(65079));
      expect(context.evaluate('x'), equals(123));
      expect(context.evaluate('y'), equals(456));
    });
  });
}
