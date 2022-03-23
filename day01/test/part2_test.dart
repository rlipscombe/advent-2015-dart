import 'package:test/test.dart';
import 'package:day01/day01.dart';

void main() {
  void assertPart2(input, expected) {
    test('$input : $expected', () {
      expect(part2(input), equals(expected));
    });
  }

  assertPart2(')', 1);
  assertPart2('()())', 5);

  assertPart2('(((', null);
}
