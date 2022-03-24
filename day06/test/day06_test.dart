import 'package:day06/day06.dart';
import 'package:test/test.dart';

void main() {
  test('initial zero', () {
    var g = Grid(3, 3);
    expect(g.count(), equals(0));
  });

  test('turn on all', () {
    var g = Grid(3, 3);
    g.turnOn(0, 0, 2, 2);
    expect(g.count(), equals(9));
  });
}
