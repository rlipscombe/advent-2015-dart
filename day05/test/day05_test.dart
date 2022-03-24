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

  test('part 2 examples', () {
    assert(isNiceString2('qjhvhtzxzqqjkmpb'));
    assert(isNiceString2('xxyxx'));
    assert(!isNiceString2('uurcxstgmygtbstg'));
    assert(!isNiceString2('ieodomkazucvgmuy'));
  });

  test('containsNonOverlappingRepeatedPair', () {
    assert(containsNonOverlappingRepeatedPair('xyxy'));
    assert(containsNonOverlappingRepeatedPair('aabcdefgaa'));
    assert(!containsNonOverlappingRepeatedPair('aaa'));
    assert(containsNonOverlappingRepeatedPair('aaaa'));
  });
}
