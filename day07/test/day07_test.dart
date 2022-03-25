import 'package:day07/ast.dart';
import 'package:day07/parser.dart';
import 'package:day07/wires.dart';
import 'package:test/test.dart';

void main() {
  group('parser', () {
    test('id', () {
      var definition = LogicDefinition();
      expect(definition.id().parse('lf').value, equals('lf'));
    });

    test('and', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('lf AND lq -> ls').value,
          equals(AndInstr('lf', 'lq', 'ls')));
    });

    test('or', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('bo OR bu -> bv').value,
          equals(OrInstr('bo', 'bu', 'bv')));
    });

    test('not', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('NOT fx -> fy').value, equals(NotInstr('fx', 'fy')));
    });

    test('literal', () {
      var definition = LogicDefinition();
      var parser = definition.build();
      expect(parser.parse('456 -> y').value, equals(LiteralInstr(456, 'y')));
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

      var instructions = input
          .trim()
          .split('\n')
          .map<Instr>((String line) => parser.parse(line).value);

      var wires = Wires(instructions);

      expect(wires.evaluate('d'), equals(72));
      expect(wires.evaluate('e'), equals(507));
      expect(wires.evaluate('f'), equals(492));
      expect(wires.evaluate('g'), equals(114));
      expect(wires.evaluate('h'), equals(65412));
      expect(wires.evaluate('i'), equals(65079));
      expect(wires.evaluate('x'), equals(123));
      expect(wires.evaluate('y'), equals(456));
    });
  });
}
