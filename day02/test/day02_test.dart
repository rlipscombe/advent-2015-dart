import 'package:test/test.dart';
import 'package:day02/day02.dart';

void main() {
  test('', () {
    expect(paperFor([2, 3, 4]), equals(58));
    expect(paperFor([1, 1, 10]), equals(43));
  });
}
