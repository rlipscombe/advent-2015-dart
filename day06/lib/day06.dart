class Grid {
  final List<List<int>> _array;

  Grid(int width, int height)
      : _array = List.generate(
            height, (_) => List.filled(width, 0, growable: false),
            growable: false);

  void turnOn(int x0, int y0, int x1, int y1) {
    _mutate(x0, y0, x1, y1, (_) => 1);
  }

  void turnOff(int x0, int y0, int x1, int y1) {
    _mutate(x0, y0, x1, y1, (_) => 0);
  }

  void toggle(int x0, int y0, int x1, int y1) {
    _mutate(x0, y0, x1, y1, (e) => (e != 0 ? 0 : 1));
  }

  void _mutate(int x0, int y0, int x1, int y1, int Function(int) cb) {
    for (var x = x0; x <= x1; ++x) {
      for (var y = y0; y <= y1; ++y) {
        _array[x][y] = cb(_array[x][y]);
      }
    }
  }

  int count() {
    return _array.fold2d(0, (acc, elt) => acc + elt);
  }
}

extension Fold2d<E> on Iterable<Iterable<E>> {
  U fold2d<U>(U init, U Function(U prev, E elt) folder) {
    U result = init;
    for (var row in this) {
      for (var elt in row) {
        result = folder(result, elt);
      }
    }
    return result;
  }
}
