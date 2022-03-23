import 'package:test/test.dart';
import 'package:day01/day01.dart';

void main() {
  void assertPart1(input, expected) {
    test('$input : $expected', () {
      expect(part1(input), equals(expected));
    });
  }

  assertPart1('(())', 0);
  assertPart1('()()', 0);

  assertPart1('(((', 3);
  assertPart1('(()(()(', 3);
  assertPart1('))(((((', 3);

  assertPart1('())', -1);
  assertPart1('))(', -1);

  assertPart1(')))', -3);
  assertPart1(')())())', -3);
}
