import 'package:test/test.dart';
import 'package:day01/day01.dart';

void main() {
  void assertDay1(input, expected) {
    test('$input : $expected', () {
      expect(day1(input), equals(expected));
    });
  }

  assertDay1('(())', 0);
  assertDay1('()()', 0);

  assertDay1('(((', 3);
  assertDay1('(()(()(', 3);
  assertDay1('))(((((', 3);

  assertDay1('())', -1);
  assertDay1('))(', -1);

  assertDay1(')))', -3);
  assertDay1(')())())', -3);
}
