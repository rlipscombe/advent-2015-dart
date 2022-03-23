import 'package:test/test.dart';
import 'package:day03/day03.dart';

void main() {
  group('part 1', () {
    void assertPart1(input, expected) {
      test('', () {
        expect(part1(input), equals(expected));
      });
    }

    assertPart1('>', 2);
    assertPart1('^>v<', 4);
    assertPart1('^v^v^v^v^v', 2);
  });

  group('part 2', () {
    void assertPart2(input, expected) {
      test('', () {
        expect(part2(input), equals(expected));
      });
    }

    assertPart2('^v', 3);
    assertPart2('^>v<', 3);
    assertPart2('^v^v^v^v^v', 11);
  });
}
