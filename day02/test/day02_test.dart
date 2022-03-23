import 'package:test/test.dart';
import 'package:day02/day02.dart';

void main() {
  test('paperFor', () {
    expect(paperFor([2, 3, 4]), equals(58));
    expect(paperFor([1, 1, 10]), equals(43));
  });

  test('ribbonFor', () {
    expect(ribbonFor([2, 3, 4]), equals(34));
    expect(ribbonFor([1, 1, 10]), equals(14));
  });
}
