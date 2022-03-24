import 'package:day05/day05.dart';
import 'package:test/test.dart';

void main() {
  test('for example', () {
    assert(isNiceString('ugknbfddgicrmopn'));
    assert(isNiceString('aaa'));
    assert(!isNiceString('jchzalrnumimnmhp'));
    assert(!isNiceString('haegwjzuvuyypxyu'));
    assert(!isNiceString('dvszwmarrgswjxmb'));
  });

  test('contains banned string', () {
    assert(containsBannedStrings('haegwjzuvuyypxyu'));
  });
}
