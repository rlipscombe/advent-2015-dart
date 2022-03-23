import 'package:day04/day04.dart';
import 'package:test/test.dart';

void main() {
  test('part 1 -- five zeroes', () {
    expect(mine('abcdef', 5), equals(609043));
    expect(mine('pqrstuv', 5), equals(1048970));
  });
}
