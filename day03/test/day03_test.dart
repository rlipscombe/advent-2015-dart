import 'package:test/test.dart';
import 'package:day03/day03.dart';

void main() {
  void assertPart1(input, expected) {
    test('', () {
      expect(part1(input), equals(expected));
    });
  }

  assertPart1('>', 2);
  assertPart1('^>v<', 4);
  assertPart1('^v^v^v^v^v^v', 2);
}
