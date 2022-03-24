class Grid<E> {
  final List<List<E>> _array;

  Grid(int width, int height, E init)
      : _array = List.generate(
            height, (_) => List.filled(width, init, growable: false),
            growable: false);

  void apply(int x0, int y0, int x1, int y1, E Function(E) cb) {
    for (var x = x0; x <= x1; ++x) {
      for (var y = y0; y <= y1; ++y) {
        _array[x][y] = cb(_array[x][y]);
      }
    }
  }

  U fold<U>(U init, U Function(U prev, E elt) folder) {
    U result = init;

    for (var row in _array) {
      for (var elt in row) {
        result = folder(result, elt);
      }
    }

    return result;
  }
}

extension Countable on Grid<bool> {
  int count() {
    return fold<int>(0, (acc, elt) => acc + (elt ? 1 : 0));
  }
}

extension Actions on Grid<bool> {
  void turnOn(int x0, int y0, int x1, int y1) {
    apply(x0, y0, x1, y1, (_) => true);
  }

  void turnOff(int x0, int y0, int x1, int y1) {
    apply(x0, y0, x1, y1, (_) => false);
  }

  void toggle(int x0, int y0, int x1, int y1) {
    apply(x0, y0, x1, y1, (elt) => !elt);
  }
}
