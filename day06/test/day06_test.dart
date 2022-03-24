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

  test('for example', () {
    var g = Grid(1000, 1000);

    g.turnOn(0, 0, 999, 999);
    expect(g.count(), equals(1000 * 1000));

    g.toggle(0, 0, 999, 0);
    expect(g.count(), equals(999 * 1000));

    g.turnOff(499, 499, 500, 500);
    expect(g.count(), equals((999 * 1000) - 4));
  });
}
