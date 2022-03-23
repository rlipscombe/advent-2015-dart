int part1(String input) {
  var result = 0;
  for (var i = 0; i < input.length; ++i) {
    switch (input[i]) {
      case '(':
        ++result;
        break;
      case ')':
        --result;
        break;
    }
  }

  return result;
}

int? part2(String input) {
  var result = 0;
  for (var i = 0; i < input.length; ++i) {
    switch (input[i]) {
      case '(':
        ++result;
        break;
      case ')':
        --result;
        break;
    }

    if (result < 0) {
      // AoC wants 1-based answers.
      return i + 1;
    }
  }

  return null;
}
